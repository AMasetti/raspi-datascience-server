# raspi-datascience-server

### Create a user for the Pi

```docker
#Inside enable SSH
sudo raspi-config 

sudo adduser <your-pi-user>
sudo visudo

# User privilege specification
root            ALL=(ALL:ALL) ALL
<your-pi-user>  ALL=(ALL:ALL) ALL
logout
```

### Install Docker on the Pi and enable user to run it

```docker
# Dependencies installation
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip

# Install Docker & Docker Compose
curl -sSL https://get.docker.com | sh
sudo pip3 install docker-compose

# Allow user to run it in sudo
sudo usermod -aG docker <your-pi-user>
```

### Creating the Docker Image and running it

```docker
docker build . -t raspi-datascience-server
docker-compose up
```

### Running the latest version in the Pi via Docker Hub

```docker
docker pull augustomas/raspi-datascience-server:latest
docker run -it -p 1515:8888 -v Projects:/home/jupyter/Projects augustomas/raspi-datascience-server:latest
```