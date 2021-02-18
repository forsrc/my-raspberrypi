sudo apt update
sudo apt install snapd
sudo snap install core

sudo snap install maas

##########################


sudo systemctl status snap.maas.supervisor.service
sudo systemctl status snap.maas-test-db.postgres.service
sudo systemctl status snap-maas-11780.mount
sudo systemctl status snap-maas-11858.mount
sudo systemctl status snap-maas\\x2dcli-16.mount
sudo systemctl status snap-maas\\x2dtest\\x2ddb-60.mount


sudo systemctl stop snap.maas.supervisor.service
sudo systemctl stop snap.maas-test-db.postgres.service
sudo systemctl stop snap-maas-11780.mount
sudo systemctl stop snap-maas-11858.mount
sudo systemctl stop snap-maas\\x2dcli-16.mount
sudo systemctl stop snap-maas\\x2dtest\\x2ddb-60.mount



sudo systemctl disable snap.maas.supervisor.service
sudo systemctl disable snap.maas-test-db.postgres.service
sudo systemctl disable snap-maas-11780.mount
sudo systemctl disable snap-maas-11858.mount
sudo systemctl disable snap-maas\\x2dcli-16.mount
sudo systemctl disable snap-maas\\x2dtest\\x2ddb-60.mount
