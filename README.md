
# ArgoCD Rollout Example

K8s 환경에서 다양한 배포 전략을 구현하기 위해서 ArgoCD, ArgoCD Rollout을 사용하는 예제입니다.

## Installation

### ArgoCD Core

```shell
# Add argocd repo
root@pc: ~/ helm repo add argo https://argoproj.github.io/argo-helm

# If already added argocd repo, please update
root@pc: ~/ helm repo update

# Check the added argocd repo
root@pc: ~/ helm search repo argo-cd
NAME            CHART VERSION   APP VERSION     DESCRIPTION                                       
argo/argo-cd    7.8.2           v2.14.2         A Helm chart for Argo CD, a declarative, GitOps...

root@pc: ~/ helm install argocd argo/argo-cd --version 7.8.2 --values argo-cd/argo-cd.values.yaml

# Portfowarding for practice
root@pc: kubectl port-forward service/argocd-server -n default 8080:443

# Check initial password
root@pc: kubectl -n default get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
qRrSva-T4CLlKLPf
```

### ArgoCD Rollout

```shell
# Add argocd repo
root@pc: ~/ helm repo add argo https://argoproj.github.io/argo-helm

# If already added argocd repo, please update
root@pc: ~/ helm repo update

# Check the added argocd repo
root@pc: ~/ helm search repo argo-rollouts
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                   
argo/argo-rollouts      2.39.0          v1.8.0          A Helm chart for Argo Rollouts
```

## Configuration

ArgoCD 설치 이후 Project, Repositories 등을 설칳고자 합니다.

```shell
```