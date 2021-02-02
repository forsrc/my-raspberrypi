#  /boot/cmdline.txt   +++ cgroup_enable=cpuset cgroup_enable=memory


sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=0.0.0.0 --apiserver-cert-extra-sans=192.168.1.10,192.168.2.10,10.244.0.0 --ignore-preflight-errors=all


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


sudo kubeadm join 192.168.1.10:6443 --token wrj4wh.s87k1du00n6nkdtb \
    --discovery-token-ca-cert-hash sha256:65e973c7b821cd23cca0e1a48f1bf8acbb89e78efee4b80f78d11af8a9822533
