FROM nginx:stable-alpine

LABEL project="secure-gitops-pipeline"
LABEL description="Containerized application for secure GitOps portfolio project"

# Upgrade Alpine packages to install available security fixes
RUN apk upgrade --no-cache

COPY app/index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]