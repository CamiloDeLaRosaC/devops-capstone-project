# IBM DevOps Capstone Project — Customer Accounts Microservice

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Python 3.9](https://img.shields.io/badge/Python-3.9-green.svg)](https://shields.io/)
[![CI build](https://github.com/CamiloDeLaRosaC/devops-capstone-project/actions/workflows/ci-build.yaml/badge.svg)](https://github.com/CamiloDeLaRosaC/devops-capstone-project/actions/workflows/ci-build.yaml)

This repository contains the complete implementation for the **IBM-CD0285EN-SkillsNetwork DevOps Capstone Project**, which is the capstone course of the **IBM DevOps and Software Engineering Professional Certificate**.

---

## Project Overview

The objective of this project is to implement a robust, production-ready, RESTful **Customer Accounts Microservice** for an e-commerce platform following modern Agile and DevOps practices:
- **Test-Driven Development (TDD)** using `nosetests` with over 95% test coverage
- **RESTful API Architecture** supporting full CRUD lifecycles for Customer Accounts
- **Application Security** enforcing HTTP Strict Transport Security (HSTS) headers via Flask-Talisman and Cross-Origin Resource Sharing (CORS) policies
- **Continuous Integration (CI)** pipeline powered by GitHub Actions
- **Containerization** with Docker running as a non-root secure user (`theia`)
- **Container Orchestration** deployment to Kubernetes / OpenShift
- **Continuous Delivery (CD)** automated delivery pipeline with Tekton

---

## Technology Stack

- **Language:** Python 3.9
- **Web Framework:** Flask 2.1.2
- **Database ORM:** Flask-SQLAlchemy 2.5.1 / SQLAlchemy 1.4.46
- **Database Engine:** PostgreSQL / SQLite
- **Security:** Flask-Talisman 1.1.0, Flask-CORS 6.0.5
- **WSGI Production Server:** Gunicorn 20.1.0
- **Process Manager:** Honcho 1.1.0
- **Testing Framework:** Nosetests, Coverage, Pinocchio, Factory-Boy
- **Linting & Code Quality:** Flake8, Pylint, Black
- **Containerization:** Docker
- **Orchestration:** Kubernetes / OpenShift (K3D / K3S)
- **CI/CD:** GitHub Actions & Tekton Pipelines

---

## Customer Accounts REST API Endpoints

| Method | Endpoint | Description | Status Code |
|---|---|---|---|
| `GET` | `/` | Root service information and entrypoint | `200 OK` |
| `GET` | `/health` | Health check endpoint | `200 OK` |
| `POST` | `/accounts` | Create a new customer account | `201 CREATED` |
| `GET` | `/accounts` | List all customer accounts | `200 OK` |
| `GET` | `/accounts/<id>` | Read a specific customer account by ID | `200 OK` / `404 NOT FOUND` |
| `PUT` | `/accounts/<id>` | Update an existing customer account by ID | `200 OK` / `404 NOT FOUND` |
| `DELETE` | `/accounts/<id>` | Delete a customer account by ID | `204 NO CONTENT` |

---

## Installation & Local Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/CamiloDeLaRosaC/devops-capstone-project.git
   cd devops-capstone-project
   ```

2. **Initialize Python 3.9 virtual environment:**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install dependencies:**
   ```bash
   pip install --upgrade pip wheel
   pip install -r requirements.txt
   pip install nose coverage pinocchio factory-boy Flask-Talisman Flask-Cors
   ```

4. **Run the Database (Docker PostgreSQL):**
   ```bash
   make db
   ```

---

## Running the Application

### Development Mode
```bash
honcho start
```

### Production Mode with Gunicorn
```bash
gunicorn --bind 0.0.0.0:8080 --log-level info service:app
```

The service will be accessible at `http://localhost:8080`.

---

## Testing & Quality Assurance

Run the automated test suite with coverage report:
```bash
nosetests -vv --with-spec --spec-color --with-coverage --cover-package=service
```

Run code quality linting:
```bash
flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
flake8 . --count --max-complexity=10 --max-line-length=127 --statistics
pylint service
```

---

## Continuous Integration (GitHub Actions)

A GitHub Actions CI workflow is configured under `.github/workflows/ci-build.yaml`. On every push and pull request to the `main` branch, the workflow:
1. Checks out the repository
2. Sets up Python 3.9
3. Installs project dependencies
4. Executes Flake8 static analysis and style checks
5. Runs the full test suite with Nosetests and asserts coverage standards

---

## Docker Containerization

1. **Build Docker image:**
   ```bash
   docker build -t accounts:1.0 .
   ```

2. **Run containerized microservice:**
   ```bash
   docker run -d --name accounts-service -p 8080:8080 accounts:1.0
   ```

3. **Verify running container:**
   ```bash
   curl http://localhost:8080/health
   ```

---

## Kubernetes & OpenShift Deployment

Deploy the microservice using Kubernetes manifests located in `deploy/`:
```bash
kubectl apply -f deploy/deployment.yaml
kubectl apply -f deploy/service.yaml
```

Check deployment and pod status:
```bash
kubectl get deployments
kubectl get pods -l app=accounts
kubectl get services accounts-service
```

---

## Tekton Continuous Delivery Pipeline

The automated Continuous Delivery pipeline is defined in the `tekton/` directory:
- `tekton/tasks.yaml`: Custom and reusable pipeline tasks (Git clone, lint, test, buildah image build, OpenShift deploy)
- `tekton/pipeline.yaml`: Tekton CD Pipeline defining task sequencing and workspace bindings
- `tekton/pvc.yaml`: PersistentVolumeClaim workspace resource definition

Trigger the pipeline with:
```bash
tkn pipeline start cd-pipeline \
    -w name=pipeline-workspace,claimName=pipelinerun-pvc \
    -p repo-url="https://github.com/CamiloDeLaRosaC/devops-capstone-project.git" \
    -p branch="main" \
    --showlog
```

---

## License

Copyright (c) 2026. Licensed under the [Apache License, Version 2.0](LICENSE).
