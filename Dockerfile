FROM nginx:1.27-alpine

LABEL project="secure-gitops-pipeline"
LABEL description="Containerized application for secure GitOps portfolio project"

COPY app/index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]