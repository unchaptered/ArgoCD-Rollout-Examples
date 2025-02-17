
# ArgoCD Rollout Example

K8s 환경에서 다양한 배포 전략을 구현하기 위해서 ArgoCD, ArgoCD Rollout을 사용하는 예제입니다.

## Installation

### ArgoCD Core

```shell
# Add argocd repo
root@pc: ~/ helm repo add argo https://argoproj.github.io/argo-helm

# Check the added argocd repo
root@pc: ~/ helm search repo argo-cd
NAME            CHART VERSION   APP VERSION     DESCRIPTION                                       
argo/argo-cd    7.8.2           v2.14.2         A Helm chart for Argo CD, a declarative, GitOps...

root@pc: ~/ helm install argocd argo/argo-cd --version 7.8.2 --values argo-cd.values.yaml

```

### ArgoCD Rollout
