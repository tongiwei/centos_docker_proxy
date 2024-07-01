sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker

#BBR
curl -O https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh && chmod +x ./install_kernel.sh && ./install_kernel.sh

# open connect server docker

docker run --name ocserv --privileged -p 443:443 -p 443:443/udp -d dockerepos/ocserv

# install 1panel
docker run -dt --name 1panel --restart always --network host -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker -v /opt:/opt -e TZ=Asia/Shanghai xeath/1panel-in-docker:latest
