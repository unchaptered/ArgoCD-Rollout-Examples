```shell
# Check
root@MacBookPro ~/ % kubectl argo rollouts list rollout -n argo-cd
NAME                    STRATEGY   STATUS        STEP  SET-WEIGHT  READY  DESIRED  UP-TO-DATE  AVAILABLE
argocd-rollout-example  BlueGreen  Paused        -     -           2/4    2        2           2        

# Rollout
root@MacBookPro ~/ % kubectl argo rollouts promote argocd-rollout-example -n argo-cd
rollout 'argocd-rollout-example' promoted

# Check
root@MacBookPro ~/ % kubectl argo rollouts list rollout -n argo-cd
NAME                    STRATEGY   STATUS        STEP  SET-WEIGHT  READY  DESIRED  UP-TO-DATE  AVAILABLE
argocd-rollout-example  BlueGreen  Healthy       -     -           2/4    2        2           2        
```