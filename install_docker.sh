curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh



sudo vim /etc/docker/daemon.json

{ 
   "data-root": "/media/nfs/pi/docker/pi-01" 
}

sudo rsync -aP /var/lib/docker/ /media/nfs/pi/docker/pi-01/var/lib/docker


sudo vim /etc/docker/daemon.json

{ 
   "data-root": "/media/nfs/pi/docker/pi-02" 
}

sudo rsync -aP /var/lib/docker/ /media/nfs/pi/docker/pi-02/var/lib/docker

sudo service docker start






sudo vim /etc/systemd/system/multi-user.target.wants/docker.service

[Unit]
RequiresMountsFor=/media/nfs/pi/docker/pi-01/var/lib/docker
RequiresMountsFor=/media/nfs/pi/docker/pi-02/var/lib/docker
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target firewalld.service containerd.service
Wants=network-online.target
Requires=docker.socket containerd.service

[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
ExecReload=/bin/kill -s HUP $MAINPID
TimeoutSec=0
RestartSec=2
Restart=always

# Note that StartLimit* options were moved from "Service" to "Unit" in systemd 229.
# Both the old, and new location are accepted by systemd 229 and up, so using the old location
# to make them work for either version of systemd.
StartLimitBurst=3

# Note that StartLimitInterval was renamed to StartLimitIntervalSec in systemd 230.
# Both the old, and new name are accepted by systemd 230 and up, so using the old name to make
# this option work for either version of systemd.
StartLimitInterval=60s

# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity

# Comment TasksMax if your systemd version does not support it.
# Only systemd 226 and above support this option.
TasksMax=infinity

# set delegate yes so that systemd does not reset the cgroups of docker containers
Delegate=yes

# kill only the docker process, not all processes in the cgroup
KillMode=process
OOMScoreAdjust=-500

[Install]
WantedBy=multi-user.target
