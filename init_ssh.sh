ssh-keygen -t rsa -b 2048

ssh-copy-id -i ~/.ssh/id_rsa.pub pi@pi-00
ssh-copy-id -i ~/.ssh/id_rsa.pub pi@pi-01
ssh-copy-id -i ~/.ssh/id_rsa.pub pi@pi-02
