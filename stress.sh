# brew install hey

hey -n 200000 -c 10 -disable-keepalive http://localhost:30181

kubectl run -i --tty load-generator --image=busybox /bin/sh
# while true; do wget -q -O- http://blue-green-hpa.argo-cd.cluster.local; done