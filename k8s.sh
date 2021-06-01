#  /boot/cmdline.txt   +++ cgroup_enable=cpuset cgroup_enable=memory

sudo systemctl disable dphys-swapfile.service
sudo swapoff -a

sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=0.0.0.0      --apiserver-cert-extra-sans=192.168.1.10 --ignore-preflight-errors=all
sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=192.168.1.10 --apiserver-cert-extra-sans=pi-00,pi-01,p1-02,192.168.1.10,192.168.2.10,0.0.0.0 --ignore
-preflight-errors=all

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo kubeadm join 192.168.1.10:6443 --token rfj1s9.ju792gulg6w8vcii \
        --discovery-token-ca-cert-hash sha256:3c824e95411ad9118461d1646f7a313943bef1afa56818c19394998e8cf8e0c6 --ignore-preflight-errors=all

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml


cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF

cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF

## add --sidecar-host=protocol://address:port
kubectl edit deployments.apps -n kubernetes-dashboard kubernetes-dashboard
- --sidecar-host=protocol://address:port

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
## add - --kubelet-insecure-tls
kubectl edit deployments.apps -n kube-system metrics-server
- --kubelet-insecure-tls

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud/deploy.yaml


############################
apt-get install bridge-utils -y

kubeadm reset -f
systemctl stop kubelet
systemctl stop docker

ifconfig cni0 down
ifconfig flannel.1 down
ifconfig del flannel.1
ifconfig del cni0

ip link del flannel.1
ip link del cni0


brctl delbr flannel.1
brctl delbr cni0
rm -rf /var/lib/cni/flannel/* && rm -rf /var/lib/cni/networks/cbr0/* && ip link delete cni0 && rm -rf /var/lib/cni/network/cni0/*


apt remove -y kubelet kubeadm kubectl
apt-get install -y kubelet kubeadm kubectl


cat <<EOF | kubectl delete -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF

cat <<EOF | kubectl delete -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF


