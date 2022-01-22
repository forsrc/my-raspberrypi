sudo nano /boot/cmdline.txt
cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory

sudo nano /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}

#########################
sudo systemctl disable dphys-swapfile.service
sudo swapoff -a

sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=192.168.1.10 --apiserver-cert-extra-sans=192.168.1.10
#sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=0.0.0.0      --apiserver-cert-extra-sans=192.168.1.10 --ignore-preflight-errors=all
#sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=192.168.1.10 --service-cidr 10.96.0.0/12 --apiserver-cert-extra-sans=pi-00,pi-01,p1-02,192.168.1.10,192.168.2.10,10.96.0.1,10.96.0.0 --ignore-preflight-errors=all

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo kubeadm join 192.168.1.10:6443 --token 7wvcyy.k835xdsbdg9en6p6 \
	--discovery-token-ca-cert-hash sha256:3d57bc0d477afbd02888e0cfa43eccbc38e2a77020bfbb4f740e077babcd0759 

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

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
- --kubelet-preferred-address-types=InternalIP


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud/deploy.yaml


cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv01
spec:
  capacity:
    storage: 100Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Recycle
  storageClassName: normal
  mountOptions:
    - hard
    - nfsvers=4.1
  nfs:
    path: /nfs/pi/k8s/pv/pv01
    server: 192.168.1.10
EOF
    
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


###########


sudo systemctl stop kubelet

sudo systemctl stop docker

sudo systemctl stop docker.socket

sudo rm -rf  /etc/kubernetes/*

sudo rm -rf /var/lib/cni/

sudo rm -rf /var/lib/kubelet/

sudo rm -rf /etc/cni/

sudo ifconfig cni0 down

sudo ifconfig flannel.1 down

sudo ifconfig docker0 down

sudo ip link delete cni0

sudo ip link delete flannel.1

 

