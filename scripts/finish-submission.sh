#!/usr/bin/env bash
set -euo pipefail
cd /home/project/devops-capstone-project
mkdir -p submission
oc process -f postgresql-ephemeral-template.json \
  -p DATABASE_SERVICE_NAME=accounts-db -p POSTGRESQL_USER=accounts \
  -p POSTGRESQL_PASSWORD=accounts -p POSTGRESQL_DATABASE=accounts | oc apply -f -
oc rollout status dc/accounts-db --timeout=180s
oc apply -f tekton/tasks.yaml -f tekton/pipeline.yaml -f tekton/pvc.yaml
CAPSTONE_RUN=$(oc create -f - -o jsonpath='{.metadata.name}' <<'YAML'
apiVersion: tekton.dev/v1beta1
kind: PipelineRun
metadata:
  generateName: capstone-cd-run-
spec:
  serviceAccountName: pipeline
  pipelineRef:
    name: capstone-cd-pipeline
  params:
    - name: repo-url
      value: https://github.com/CamiloDeLaRosaC/devops-capstone-project.git
    - name: branch
      value: main
  workspaces:
    - name: pipeline-workspace
      persistentVolumeClaim:
        claimName: capstone-pvc
YAML
)
printf 'PipelineRun: %s\n' "$CAPSTONE_RUN"
tkn pipelinerun logs "$CAPSTONE_RUN" -f | tee submission/pipelinerun.txt
oc wait --for=condition=Succeeded "pipelinerun/$CAPSTONE_RUN" --timeout=30s
oc get all -l app=accounts | tee submission/kube-deploy-accounts.txt
docker images accounts:1.0 | tee submission/kube-images.txt
curl -fsS -H 'X-Forwarded-Proto: https' http://127.0.0.1:8080/ | tee submission/kube-app-output.json
printf '[nosetests]\nverbosity=2\n' > submission/nose.cfg
docker run --rm -v "$PWD:/work:ro" -w /tmp \
  -e DATABASE_URI=sqlite:////tmp/accounts-tests.db -e PYTHONPATH=/work \
  -e PYTHONDONTWRITEBYTECODE=1 accounts:1.0 \
  nosetests --config=/work/submission/nose.cfg -v --with-coverage \
  --cover-package=service /work/tests 2>&1 | tee submission/security-headers-done.txt
python3 - <<'PY'
import json
import urllib.request
from pathlib import Path
run_id = '38198834600'
url = f'https://api.github.com/repos/CamiloDeLaRosaC/devops-capstone-project/actions/runs/{run_id}/jobs'
request = urllib.request.Request(url, headers={'User-Agent': 'capstone-evidence'})
with urllib.request.urlopen(request) as response:
    payload = json.load(response)
lines = [f'CI build - main - run {run_id}']
for job in payload['jobs']:
    lines.append(f"{job['name']}: {job['conclusion']}")
    if job['conclusion'] != 'success':
        raise RuntimeError('GitHub Actions job did not succeed')
    for step in job['steps']:
        lines.append(f"  {step['conclusion']}: {step['name']}")
lines.append(f'https://github.com/CamiloDeLaRosaC/devops-capstone-project/actions/runs/{run_id}')
Path('submission/ci-workflow-done.txt').write_text('\n'.join(lines) + '\n')
print('\n'.join(lines))
import zipfile
names = ['ci-workflow-done.txt', 'security-headers-done.txt', 'kube-app-output.json',
         'kube-images.txt', 'kube-deploy-accounts.txt', 'pipelinerun.txt']
with zipfile.ZipFile('/home/project/capstone-evidencias.zip', 'w', zipfile.ZIP_DEFLATED) as archive:
    for name in names:
        archive.write(Path('submission') / name, name)
print('SUCCESS: /home/project/capstone-evidencias.zip')
PY
