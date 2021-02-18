#  /boot/cmdline.txt   +++ cgroup_enable=cpuset cgroup_enable=memory


sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=0.0.0.0 --apiserver-cert-extra-sans=192.168.1.10,192.168.2.10 --ignore-preflight-errors=all


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo kubeadm join 192.168.1.10:6443 --token jyqzu7.70nf8lndjtave03a \
    --discovery-token-ca-cert-hash sha256:cb3b7c1fedec6c7f2cf304359fd7be1a1a7dd4ee4f8bb0854827d57ed5fc5694


kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml


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
