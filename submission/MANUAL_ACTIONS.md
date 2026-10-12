# IBM DevOps Capstone Project — Manual Action Guide

This guide details the remaining user actions that require either UI interaction (capturing browser screenshots of your GitHub Projects Kanban board) or executing commands inside your assigned **IBM Skills Network Cloud IDE / OpenShift cluster** environment.

---

## Part 1: GitHub Projects Board & Screenshot Captures (Tasks 3–6, 8–12, 18, 20, 24, 25, 27, 28, 33)

All 10 user stories have already been created as GitHub Issues in your repository:
[https://github.com/CamiloDeLaRosaC/devops-capstone-project/issues](https://github.com/CamiloDeLaRosaC/devops-capstone-project/issues)

### Step 1: Create the GitHub Projects Kanban Board
1. Open your repository in your browser: [https://github.com/CamiloDeLaRosaC/devops-capstone-project](https://github.com/CamiloDeLaRosaC/devops-capstone-project)
2. Click the **Projects** tab at the top.
3. Click **New project** (or create a Board project).
4. Select the **Board** template and name it `Customer Accounts Kanban`.
5. Ensure the board columns/statuses are configured as follows:
   - `New Issues`
   - `Ice Box`
   - `Product Backlog`
   - `Sprint Backlog`
   - `In Progress`
   - `Done`
6. Add the 10 repository issues to the board.

---

### Step 2: Capture Planning Stage Screenshots (Phase 1)

Follow this order to document the historical planning stages before moving cards forward:

#### Task 3: `submission/planning-userstories-done.png`
- **State:** Place all user story cards in the **New Issues** column.
- **Action:** Take a screenshot of the board and save as `submission/planning-userstories-done.png`.

#### Task 4: `submission/planning-productbacklog-done.png`
- **State:** Move the user stories to the **Ice Box** column.
- **Action:** Take a screenshot of the board and save as `submission/planning-productbacklog-done.png`.

#### Task 5: `submission/planning-labels-done.png`
- **State:** Move the user stories to the **Product Backlog** column. Ensure the labels (`Technical Debt`, `enhancement`) are clearly visible on each card.
- **Action:** Take a screenshot of the board and save as `submission/planning-labels-done.png`.

#### Task 6: `submission/planning-kanban-done.png`
- **State:** Move the five Sprint 1 user stories (#1, #2, #3, #4, #5) into the **Sprint Backlog** column. Ensure story point estimates (e.g. 1 to 3 points) or Sprint 1 milestone assignments are visible.
- **Action:** Take a screenshot of the board and save as `submission/planning-kanban-done.png`.

---

### Step 3: Capture Sprint 1 Implementation Screenshots (Phase 2)

As each Sprint 1 user story was implemented and verified:

#### Task 8: `submission/rest-techdebt-done.png`
- Move **"Setting up the development environment"** to **Done**. Take screenshot.

#### Task 9: `submission/read-accounts.png`
- Move **"Read an account from the service"** to **Done**. Take screenshot.

#### Task 10: `submission/list-accounts.png`
- Move **"List all accounts in the service"** to **Done**. Take screenshot.

#### Task 11: `submission/update-accounts.png`
- Move **"Update an account in the service"** to **Done**. Take screenshot.

#### Task 12: `submission/delete-accounts.png`
- Move **"Delete an account from the service"** to **Done**. Take screenshot.

---

### Step 4: Capture Sprint 2 Screenshots (Phase 3 & 4)

#### Task 18: `submission/sprint2-plan.png`
- Move both Sprint 2 user stories (#6: "Need the ability to automate continuous integration checks", #7: "Need to add security headers and CORS policies") from Product Backlog into **Sprint Backlog**.
- Take screenshot and save as `submission/sprint2-plan.png`.

#### Task 20: `submission/ci-kanban-done.png`
- Move **"Need the ability to automate continuous integration checks"** to **Done**. Take screenshot.

#### Task 24: `submission/security-kanban-done.png`
- Move **"Need to add security headers and CORS policies"** to **Done**. Take screenshot.

---

### Step 5: Capture Sprint 3 Screenshots (Phase 5 & 6)

#### Task 25: `submission/sprint3-plan.png`
- Move all three Sprint 3 user stories (#8: "Containerize your microservice using Docker", #9: "Deploy your Docker image to Kubernetes", #10: "Create a CD pipeline to automate deployment to Kubernetes") into **Sprint Backlog**.
- Take screenshot and save as `submission/sprint3-plan.png`.

#### Task 27: `submission/kube-docker-done.png`
- Move **"Containerize your microservice using Docker"** to **Done**. Take screenshot.

#### Task 28: `submission/kube-kubernetes-done.png`
- Move **"Deploy your Docker image to Kubernetes"** to **Done**. Take screenshot.

#### Task 33: `submission/cd-pipeline-done.png`
- Move **"Create a CD pipeline to automate deployment to Kubernetes"** to **Done**. Take screenshot.

---

## Part 2: IBM Skills Network Cloud IDE Execution (Tasks 30, 31, 32)

Open your assigned **IBM Cloud IDE with OpenShift** from your Coursera Capstone Project lab links:

### 1. Initialize Workspace & Clone Repo
```bash
git clone https://github.com/CamiloDeLaRosaC/devops-capstone-project.git
cd devops-capstone-project
```

### 2. Task 30: Docker Image Evidence
Build the image and capture details:
```bash
docker build -t accounts:1.0 .
docker images accounts:1.0 > submission/kube-images.txt
```

### 3. Task 31: Kubernetes Deployment Evidence
Deploy the microservice and capture cluster objects:
```bash
kubectl apply -f deploy/
kubectl get all -l app=accounts > submission/kube-deploy-accounts.txt
```

### 4. Task 32: Tekton Pipeline Execution
Apply Tekton manifests and run the pipeline:
```bash
kubectl apply -f tekton/tasks.yaml
kubectl apply -f tekton/pipeline.yaml
kubectl apply -f tekton/pvc.yaml

tkn pipeline start cd-pipeline \
  -w name=pipeline-workspace,claimName=pipelinerun-pvc \
  -p repo-url="https://github.com/CamiloDeLaRosaC/devops-capstone-project.git" \
  -p branch="main" \
  --showlog > submission/pipelinerun.txt
```

### 5. Push Collected Artifacts
```bash
git add submission/
git commit -m "docs: add cluster deployment and pipeline execution evidence"
git push origin main
```
