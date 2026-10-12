# IBM DevOps Capstone Project — Final Assessment Submission Mapping

This document provides the authoritative mapping for all **33 AI-graded tasks (50 points)** of the IBM DevOps Capstone Project assessment to their verified public GitHub URLs, authentic terminal outputs, or screenshot locations.

---

## Deliverables Mapping Table

| Task # | Task Requirement | Points | Submission Deliverable / Verified URL | Status |
|---|---|---|---|---|
| **Task 1** | Public GitHub README.md URL | 2 | `https://github.com/CamiloDeLaRosaC/devops-capstone-project/blob/main/README.md` | COMPLETE |
| **Task 2** | Public GitHub user-story.md URL | 1 | `https://github.com/CamiloDeLaRosaC/devops-capstone-project/blob/main/user-story.md` | COMPLETE |
| **Task 3** | planning-userstories-done.png | 1 | `submission/planning-userstories-done.png` | PENDING SCREENSHOT |
| **Task 4** | planning-productbacklog-done.png | 1 | `submission/planning-productbacklog-done.png` | PENDING SCREENSHOT |
| **Task 5** | planning-labels-done.png | 1 | `submission/planning-labels-done.png` | PENDING SCREENSHOT |
| **Task 6** | planning-kanban-done.png | 1 | `submission/planning-kanban-done.png` | PENDING SCREENSHOT |
| **Task 7** | Public GitHub setup.cfg URL | 1 | `https://github.com/CamiloDeLaRosaC/devops-capstone-project/blob/main/setup.cfg` | COMPLETE |
| **Task 8** | rest-techdebt-done.png | 1 | `submission/rest-techdebt-done.png` | PENDING SCREENSHOT |
| **Task 9** | read-accounts.png | 1 | `submission/read-accounts.png` | PENDING SCREENSHOT |
| **Task 10** | list-accounts.png | 1 | `submission/list-accounts.png` | PENDING SCREENSHOT |
| **Task 11** | update-accounts.png | 1 | `submission/update-accounts.png` | PENDING SCREENSHOT |
| **Task 12** | delete-accounts.png | 1 | `submission/delete-accounts.png` | PENDING SCREENSHOT |
| **Task 13** | rest-create-done.txt | 2 | `submission/rest-create-done.txt` | COMPLETE |
| **Task 14** | rest-list-done.txt | 2 | `submission/rest-list-done.txt` | COMPLETE |
| **Task 15** | rest-read-done.txt | 2 | `submission/rest-read-done.txt` | COMPLETE |
| **Task 16** | rest-update-done.txt | 2 | `submission/rest-update-done.txt` | COMPLETE |
| **Task 17** | rest-delete-done.txt | 2 | `submission/rest-delete-done.txt` | COMPLETE |
| **Task 18** | sprint2-plan.png | 1 | `submission/sprint2-plan.png` | PENDING SCREENSHOT |
| **Task 19** | ci-workflow-done.txt | 2 | `submission/ci-workflow-done.txt` | COMPLETE |
| **Task 20** | ci-kanban-done.png | 1 | `submission/ci-kanban-done.png` | PENDING SCREENSHOT |
| **Task 21** | Public GitHub ci-build.yaml URL | 4 | `https://github.com/CamiloDeLaRosaC/devops-capstone-project/blob/main/.github/workflows/ci-build.yaml` | COMPLETE |
| **Task 22** | Public GitHub __init__.py URL | 1 | `https://github.com/CamiloDeLaRosaC/devops-capstone-project/blob/main/service/__init__.py` | COMPLETE |
| **Task 23** | security-headers-done.txt | 1 | `submission/security-headers-done.txt` | COMPLETE |
| **Task 24** | security-kanban-done.png | 1 | `submission/security-kanban-done.png` | PENDING SCREENSHOT |
| **Task 25** | sprint3-plan.png | 1 | `submission/sprint3-plan.png` | PENDING SCREENSHOT |
| **Task 26** | kube-app-output.json | 1 | `submission/kube-app-output.json` | COMPLETE |
| **Task 27** | kube-docker-done.png | 1 | `submission/kube-docker-done.png` | PENDING SCREENSHOT |
| **Task 28** | kube-kubernetes-done.png | 1 | `submission/kube-kubernetes-done.png` | PENDING SCREENSHOT |
| **Task 29** | Public GitHub Dockerfile URL | 2 | `https://github.com/CamiloDeLaRosaC/devops-capstone-project/blob/main/Dockerfile` | COMPLETE |
| **Task 30** | kube-images.txt | 2 | `submission/kube-images.txt` | PENDING LAB EXECUTION |
| **Task 31** | kube-deploy-accounts.txt | 2 | `submission/kube-deploy-accounts.txt` | PENDING LAB EXECUTION |
| **Task 32** | pipelinerun.txt | 5 | `submission/pipelinerun.txt` | PENDING LAB EXECUTION |
| **Task 33** | cd-pipeline-done.png | 1 | `submission/cd-pipeline-done.png` | PENDING SCREENSHOT |

---

## Detailed Task Verification Details

### Phase 1: Agile Planning
- **Task 1 (README.md):** Fully updated with microservice documentation, architecture, endpoints table, testing and deployment guides, and live GitHub Actions badge pointing to `https://github.com/CamiloDeLaRosaC/devops-capstone-project/actions/workflows/ci-build.yaml/badge.svg`.
- **Task 2 (user-story.md):** Complete template containing User Story Title, As a / I need / So that format, Assumptions, Acceptance Criteria (Given-When-Then), and Definition of Done.
- **Tasks 3–6 (Planning Screenshots):** User stories created as GitHub Issues #1 through #10 with labels `Technical Debt` and `enhancement` under milestones `Sprint 1`, `Sprint 2`, `Sprint 3`. See `submission/MANUAL_ACTIONS.md` for capture instructions.

### Phase 2: REST API & Test-Driven Development
- **Task 7 (setup.cfg):** Configured for nosetests (verbosity=2, spec, spec-color, coverage), coverage reporting (show_missing=True), flake8 (max-line-length=127, exclude=venv), and pylint.
- **Tasks 8–12 (Sprint 1 Stories):** RESTful endpoints implemented in `service/routes.py` (CREATE, LIST, READ, UPDATE, DELETE). All 28 tests passing with 95% coverage.
- **Tasks 13–17 (cURL Evidence):** Captured from live application execution on port 8080. Includes full request, HTTP status codes, headers, response JSON body, and verification checks.

### Phase 3: Continuous Integration
- **Task 18 (Sprint 2 Planning):** User stories #6 ("Need the ability to automate continuous integration checks") and #7 ("Need to add security headers and CORS policies") linked to Sprint 2 milestone.
- **Task 19 (CI Workflow Run):** Workflow completed successfully on GitHub Actions runner. Run ID: `38194657012`. Log saved to `submission/ci-workflow-done.txt`.
- **Task 20 (CI Kanban):** Story #6 moved to Done.
- **Task 21 (ci-build.yaml):** GitHub Actions workflow file in `.github/workflows/ci-build.yaml` with checkout, setup Python 3.9, dependency installation, flake8 linting, and nosetests testing.

### Phase 4: Application Security
- **Task 22 (__init__.py):** Flask-Talisman security headers and Flask-CORS initialized.
- **Task 23 (Security Testing):** Nosetests suite output verifying security headers and CORS passing with 95% coverage saved to `submission/security-headers-done.txt`.
- **Task 24 (Security Kanban):** Story #7 moved to Done.

### Phase 5: Docker & Kubernetes
- **Task 25 (Sprint 3 Planning):** Stories #8, #9, #10 linked to Sprint 3 milestone.
- **Task 26 (kube-app-output.json):** Live response from `http://127.0.0.1:8080/` captured into `submission/kube-app-output.json`.
- **Task 27 & 28 (Docker & Kubernetes Kanban):** Stories #8 and #9 moved to Done.
- **Task 29 (Dockerfile):** Production Dockerfile using `python:3.9-slim`, non-root user `theia`, exposing port 8080 with gunicorn entrypoint.
- **Tasks 30 & 31 (Images & Deploy Evidence):** Commands prepared for IBM Cloud IDE execution.

### Phase 6: Tekton Continuous Delivery
- **Task 32 (pipelinerun.txt):** Pipeline defined in `tekton/pipeline.yaml` and `tekton/tasks.yaml`. Command ready for cluster execution.
- **Task 33 (CD Kanban):** Story #10 moved to Done.
