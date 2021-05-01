#  /boot/cmdline.txt   +++ cgroup_enable=cpuset cgroup_enable=memory

sudo systemctl disable dphys-swapfile.service
sudo swapoff -a

sudo systemctl start systemd-resolved

sudo kubeadm init  --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=0.0.0.0 --apiserver-cert-extra-sans=192.168.1.10,192.168.2.10 --ignore-preflight-errors=all


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubeadm join 192.168.1.10:6443 --token weicmw.p6q7a6heydi79rn9 \
        --discovery-token-ca-cert-hash sha256:ea5cb737c00ff83916c8679d7fcf8609baced55b23a48c78b65142902884e3ae

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
