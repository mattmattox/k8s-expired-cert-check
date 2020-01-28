# k8s-expired-cert-check
This script will check for expired/expiring kubernetes certificates

## Install
```
git clone https://github.com/mattmattox/k8s-expired-cert-check.git
cd k8s-expired-cert-check
kubectl apply -f .
```

## Upgrade
```
rm -rf drain-node-on-crash
git clone https://github.com/mattmattox//k8s-expired-cert-check.git
cd k8s-expired-cert-check
kubectl apply -f .
```
