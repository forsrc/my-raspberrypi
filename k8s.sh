#  /boot/cmdline.txt   +++ cgroup_enable=cpuset cgroup_enable=memory

sudo systemctl disable dphys-swapfile.service
sudo swapoff -a

sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=0.0.0.0 --apiserver-cert-extra-sans=192.168.1.10 --ignore-preflight-errors=all


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo kubeadm join 192.168.1.10:6443 --token kk9byi.yurlcdxd3n38n7nv \
        --discovery-token-ca-cert-hash sha256:06e42a60dcccc62e90e1722388d41c67ebe402805ca590c32394a3ad223a8e3c  --ignore-preflight-errors=all

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml

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

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
## add - --kubelet-insecure-tls
- --kubelet-insecure-tls

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
