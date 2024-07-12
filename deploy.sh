echo "Logging into Oracle Cloud Registry"
source .env
docker login -u "$ORACLE_CLOUD_USERNAME" -p "$ORACLE_CLOUD_PASSWORD" me-jeddah-1.ocir.io
docker-compose build backend
docker tag hello-world-php-backend:latest me-jeddah-1.ocir.io/axjwpjxefzql/hello-world-php/backend
docker push me-jeddah-1.ocir.io/axjwpjxefzql/hello-world-php/backend:latest
kubectl rollout restart deployment.apps/hello-world-php
echo "Deployment completed successfully!"
