# Secure GitOps Pipeline

A DevOps portfolio project demonstrating secure container deployment using Docker, GitHub Actions, Trivy, Kubernetes, ArgoCD, and HashiCorp Vault.

## Project Objective

This project demonstrates a secure software delivery process where application changes are containerized, scanned for vulnerabilities, and deployed through a GitOps-managed Kubernetes workflow.

## Planned Architecture

```text
Developer pushes code to GitHub
        ↓
GitHub Actions builds Docker image
        ↓
Trivy scans image for vulnerabilities
        ↓
Only approved images proceed to deployment
        ↓
ArgoCD synchronizes Kubernetes configuration
        ↓
Application runs in a local Kubernetes cluster
        ↓
Vault manages application secrets securely
```

## Technology Stack

| Technology | Purpose |
|---|---|
| Docker | Packages the web application into a container image |
| GitHub Actions | Automates build and security scanning steps |
| Trivy | Detects vulnerabilities in container images |
| Kubernetes / kind | Runs the application in a local cluster |
| ArgoCD | Performs GitOps-based deployment synchronization |
| HashiCorp Vault | Demonstrates secure secrets management |

## Current Progress

| Milestone | Status |
|---|---|
| Repository structure | Complete |
| Containerized web application | complete |
| GitHub Actions pipeline | Planned |
| Trivy vulnerability scanning | Planned |
| Kubernetes deployment | Planned |
| ArgoCD synchronization | Planned |
| Vault integration | Planned |

## Evidence

### 1. Containerized Application Running Locally

The application was packaged as an Nginx-based Docker container and exposed locally through port `8080`.

```bash
docker build -t secure-gitops-app:v1 .
docker run -d --name secure-gitops-web -p 8080:80 secure-gitops-app:v1
```

![Containerized application running locally](screenshots/docker-app-running.png)