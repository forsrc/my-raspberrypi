#  /boot/cmdline.txt   +++ cgroup_enable=cpuset cgroup_enable=memory


sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=0.0.0.0 --apiserver-cert-extra-sans=192.168.1.10,192.168.2.10 --ignore-preflight-errors=all


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo kubeadm join 192.168.1.10:6443 --token zfgd63.0de6cs85uuqhg61v \
    --discovery-token-ca-cert-hash sha256:3b298ef7fca01fcacaebd7204aefcd9af3ba5208d42c3f5863b9d5728afda7a1


kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
