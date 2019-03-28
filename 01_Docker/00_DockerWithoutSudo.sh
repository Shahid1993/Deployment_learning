sudo groupadd docker
sudo gpasswd -a ${USERNAME} docker
sudo chmod o+rw /var/run/docker.sock
sudo service docker restart
