# Kubernetes Deployment Guide

This guide explains how to deploy the Laravel eCommerce application to Kubernetes.

## Prerequisites

- Kubernetes cluster (v1.24+)
- kubectl configured to access your cluster
- Docker registry access (for pushing images)
- PersistentVolume storage class available

## Architecture

The application consists of:
- **App Deployment**: Laravel application with Nginx + PHP-FPM (2 replicas)
- **MySQL Deployment**: Database server (1 replica, persistent storage)
- **Redis Deployment**: Cache and session store (1 replica, persistent storage)
- **Queue Workers**: Background job processors (2 replicas)
- **Scheduler**: Laravel task scheduler (1 replica)

## MySQL Port Configuration

MySQL is exposed on **NodePort 22122** to avoid conflicts with other MySQL instances.

## Quick Start

### 1. Build and Push Docker Image

```bash
# Build the image
docker build -t your-registry/ecommerce-app:latest .

# Push to registry
docker push your-registry/ecommerce-app:latest
```

### 2. Update Image Reference

Edit `k8s/app-deployment.yaml`, `k8s/queue-deployment.yaml`, and `k8s/scheduler-deployment.yaml` to use your image:

```yaml
image: your-registry/ecommerce-app:latest
```

### 3. Update Secrets

Edit `k8s/secrets.yaml` and update:
- `DB_PASSWORD`: Your database password
- `MYSQL_ROOT_PASSWORD`: MySQL root password
- `APP_KEY`: Generate with `php artisan key:generate --show`

### 4. Deploy to Kubernetes

```bash
# Apply all resources
kubectl apply -k k8s/

# Or apply individually
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/secrets.yaml
kubectl apply -f k8s/mysql-pvc.yaml
kubectl apply -f k8s/mysql-deployment.yaml
kubectl apply -f k8s/mysql-service.yaml
kubectl apply -f k8s/redis-pvc.yaml
kubectl apply -f k8s/redis-deployment.yaml
kubectl apply -f k8s/redis-service.yaml
kubectl apply -f k8s/app-deployment.yaml
kubectl apply -f k8s/app-service.yaml
kubectl apply -f k8s/queue-deployment.yaml
kubectl apply -f k8s/scheduler-deployment.yaml
kubectl apply -f k8s/ingress.yaml
```

### 5. Run Database Migrations

```bash
# Get a pod name
POD_NAME=$(kubectl get pods -n ecommerce -l app=ecommerce-app -o jsonpath='{.items[0].metadata.name}')

# Run migrations
kubectl exec -n ecommerce $POD_NAME -- php artisan migrate --force

# Seed database (optional)
kubectl exec -n ecommerce $POD_NAME -- php artisan db:seed --force
```

### 6. Configure Ingress

Update `k8s/ingress.yaml` with your domain name:

```yaml
spec:
  rules:
  - host: your-domain.com
```

## Accessing Services

### Application
- **Internal**: `http://app-service.ecommerce.svc.cluster.local`
- **External**: Via Ingress or port-forward:
  ```bash
  kubectl port-forward -n ecommerce svc/app-service 8000:80
  ```
  Then access at `http://localhost:8000`

### MySQL
- **Internal**: `mysql-service.ecommerce.svc.cluster.local:3306`
- **External NodePort**: `<node-ip>:22122`

### Redis
- **Internal**: `redis-service.ecommerce.svc.cluster.local:6379`

## Monitoring

```bash
# Check all pods
kubectl get pods -n ecommerce

# Check services
kubectl get svc -n ecommerce

# View logs
kubectl logs -n ecommerce -l app=ecommerce-app --tail=100

# Check MySQL logs
kubectl logs -n ecommerce -l app=mysql --tail=100
```

## Scaling

```bash
# Scale app replicas
kubectl scale deployment app-deployment -n ecommerce --replicas=5

# Scale queue workers
kubectl scale deployment queue-deployment -n ecommerce --replicas=4
```

## Troubleshooting

### Pods not starting
```bash
kubectl describe pod <pod-name> -n ecommerce
kubectl logs <pod-name> -n ecommerce
```

### Database connection issues
```bash
# Test MySQL connection
kubectl exec -n ecommerce -it <app-pod> -- mysql -h mysql-service -u ecommerce_user -p
```

### Storage issues
```bash
# Check PVC status
kubectl get pvc -n ecommerce
kubectl describe pvc mysql-pvc -n ecommerce
```

## Cleanup

```bash
# Delete all resources
kubectl delete -k k8s/

# Or delete namespace (removes everything)
kubectl delete namespace ecommerce
```

## Production Considerations

1. **Secrets Management**: Use external secret management (e.g., HashiCorp Vault, AWS Secrets Manager)
2. **SSL/TLS**: Configure cert-manager for automatic certificate management
3. **Monitoring**: Add Prometheus and Grafana for metrics
4. **Logging**: Configure centralized logging (e.g., ELK stack, Loki)
5. **Backups**: Set up automated MySQL backups
6. **Resource Limits**: Adjust based on your workload
7. **High Availability**: Consider using MySQL operator for HA MySQL setup
8. **Image Security**: Scan images for vulnerabilities
9. **Network Policies**: Implement network policies for security
10. **Pod Disruption Budgets**: Add PDBs for availability during updates

