
# argo-cd-blue-green-multi-service-hpa

HPA를 사용하여 파드 확장을 하는 경우,
`argoproj.io/v1alpha1`/`Route`를 대상으로 하면됩니다.
자세한 내용은 세부 manifest들을 확인해주세요.

## Scripts

```shell
# Check
root@MacBookPro ~/ % kubectl argo rollouts list rollout -n argo-cd
NAME            STRATEGY   STATUS        STEP  SET-WEIGHT  READY  DESIRED  UP-TO-DATE  AVAILABLE
blue-green-hpa  BlueGreen  Paused        -     -           2/4    2        2           2        

# Rollout
root@MacBookPro ~/ % kubectl argo rollouts promote blue-green-hpa -n argo-cd
rollout 'blue-green-hpa' promoted

# Check
root@MacBookPro ~/ % kubectl argo rollouts list rollout -n argo-cd
NAME            STRATEGY   STATUS        STEP  SET-WEIGHT  READY  DESIRED  UP-TO-DATE  AVAILABLE
blue-green-hpa  BlueGreen  Healthy       -     -           2/4    2        2           2        
```