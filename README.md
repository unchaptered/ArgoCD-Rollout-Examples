
# Argo Rollouts Example

쿠버네티스에서는 다양한 워크로드 리소스를 통해서 어플리케이션을 배포하고 관리할 수 있습니다.

가장 범용적인 워크로드인 `Deployment`를 예시로 들면, 이 친구의 배포 전략은 오직 2가지만 지원합니다.

1. Recreate : 지웠다가 만드는 것
2. RollingUpdate : 지정된 수량 및 비율에 맞춰서 단계적으로 미리 만들고 롤아웃 하는 것

따라서 Blue/Green, Canary 등의 전략을 사용하기 위해서는 별도의 도구를 사용해야 합니다.

[Argo Rollouts](https://argoproj.github.io/argo-rollouts/concepts/)은 K8s Deployment와 동일한 K8s 워크로드 리소스로 다양한 고급 배포 전략 및 기능을 제공합니다.

1. 배포 전략 : Blue/Green, Canary + (기존에 있던) RollingUpdate, Recreate
2. 고급 트래픽 라우팅을 위한 Ingress Controller & Service Mesh와의 통합
3. 배포 전략을 분석하기 위한 매트릭 공급자와의 통합
4. 성공하거나 실패한 매트릭을 기반으로 하는 자동화된 Promotion || Rollback

이 문서에서는 Argo Rollouts를 사용한 몇 가지 예제들을 제공합니다.

## Get-Started

아래 명령어를 입력하면 자동으로 blue-green, canary 등의 실습 파일이 생성됩니다.

```shell
k apply -f argo-cd-base/.
```

## Installation

1. Argo CD
2. Argo Rollouts

### Argo CD

> [argo-helm/charts/argo-cd](https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd)

```shell
# Add argocd repo
root@pc: ~/ helm repo add argo https://argoproj.github.io/argo-helm

# If already added argocd repo, please update
root@pc: ~/ helm repo update

# Check the added argocd repo
root@pc: ~/ helm search repo argo-cd
NAME            CHART VERSION   APP VERSION     DESCRIPTION                                       
argo/argo-cd    7.8.2           v2.14.2         A Helm chart for Argo CD, a declarative, GitOps...

# Install ArgoCD
root@pc: ~/ helm install argo-cd argo/argo-cd --version 7.8.2 --values argo-cd/argo-cd.values.yaml --namespace argo-cd --create-namespace

# Port fowarding for practice
root@pc: kubectl port-forward service/argo-cd-argocd-server -n argo-cd 8080:443

# Check initial password
root@pc: kubectl -n default get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
C5FbWSVNEvJWPuTx%
```

### Argo Rollouts

> [argo-helm/charts/argo-rollouts](https://github.com/argoproj/argo-helm/tree/main/charts/argo-rollouts)

```shell
# Add argocd repo
root@pc: ~/ helm repo add argo https://argoproj.github.io/argo-helm

# If already added argocd repo, please update
root@pc: ~/ helm repo update

# Check the added argocd repo
root@pc: ~/ helm search repo argo-rollouts
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                   
argo/argo-rollouts      2.39.0          v1.8.0          A Helm chart for Argo Rollouts

# Install ArgoCD Rollout
root@pc: ~/ helm install argo-rollouts argo/argo-rollouts --version 2.39.0 --values argo-rollouts/argo-rollouts.values.yaml --namespace argo-rollouts --create-namespace

# Port fowarding for practice
# root@pc: ~/ kubectl port-forward service/argo-rollouts-dashboard -n argo-rollouts 31000:3100
```

### Argo Rollout Dashboard

> [ArgoCD Rollout Installation](https://argo-rollouts.readthedocs.io/en/stable/installation/)

```shell
brew install argoproj/tap/kubectl-argo-rollouts

kubectl argo rollouts version
```