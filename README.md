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
| Containerized web application | complete|
| GitHub Actions pipeline | Complete |
| Trivy vulnerability scanning | Complete — vulnerable image blocked, remediated, and rescanned successfully|
| Kubernetes deployment |  Complete — application running with two healthy replicas |
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

### 2. Automated Vulnerability Detection and Remediation

A GitHub Actions workflow automatically builds and scans the container image using Trivy. During the first scan, the security gate detected a fixable `HIGH` severity vulnerability in the Alpine `libxml2` package and blocked the image from progressing.

![Trivy blocked vulnerable image](screenshots/trivy-vulnerability-blocked.png)

The Docker image was remediated by upgrading available Alpine packages during the image build. A subsequent workflow run verified that the corrected image passed the configured `HIGH` and `CRITICAL` vulnerability gate.

![Trivy scan passed after remediation](screenshots/trivy-workflow-passed.png)

### 3. Local Kubernetes Deployment

The vulnerability-remediated container image was deployed to a local Kubernetes cluster created using `kind`. The deployment runs two replicas and exposes the application through a Kubernetes `NodePort` Service. Readiness and liveness probes were configured to verify application health.

```bash
kind create cluster --config kubernetes/cluster/kind-config.yml
kind load docker-image secure-gitops-app:v2 --name secure-gitops
kubectl apply -f kubernetes/manifests/namespace.yml
kubectl apply -f kubernetes/manifests/deployment.yml
kubectl apply -f kubernetes/manifests/service.yml
kubectl get deployments,pods,services -n secure-gitops -o wide
```

#### Kubernetes Resources Running Locally

![Kubernetes pods and service running](screenshots/kubernetes-pods-running.png)

#### Application Served Through Kubernetes

![Application running through Kubernetes](screenshots/kubernetes-app-running.png)

