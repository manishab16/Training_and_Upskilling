Docker -
Docker is a platform that allows you to package, ship, and run applications in lightweight, portable containers.

A container = A small, isolated environment that contains:

Why do you need docker?
- Compatibility/Dependency
- Long setup time
- Different Dev/Test/Prod environments

Run – start a container
docker run nginx

ps – list containers
docker ps
docker ps -a
![App Screenshot](images/image1.png)

STOP – stop a container
docker ps

docker stop silly_sammet

![App Screenshot](images/image2.png)

docker ps -a
![App Screenshot](images/image3.png)


Rm – Remove a container
docker rm name
![App Screenshot](images/image4.png)

![App Screenshot](images/image5.png)

images – List images
![App Screenshot](images/image6.png)


rmi – Remove images
docker rmi nginx

Pull – download an imag
docker pull nginx
![App Screenshot](images/image7.png)


Append a command
docker run ubuntu sleep 5
![App Screenshot](images/image8.png)

Exec – execute a command


docker run commands
Run – tag
docker run redis
![App Screenshot](images/image9.png)



Environment Variables
![App Screenshot](images/image11.png)


![App Screenshot](images/image10.png)

Docker image -
A Docker Image is a template or blueprint used to create containers.

How to create my own image?
Dockerfile
![App Screenshot](images/image16.png)

![App Screenshot](images/image17.png)

![App Screenshot](images/image18.png)


Default networks
![App Screenshot](images/image12.png)


docker compose
![App Screenshot](images/image13.png)


docker run links
docker run -d --name=redis redis 
docker run -d --name=db
docker run -d --name=vote –p 5000:80
docker run -d --name=result –p 5001:80
docker run -d --name=worker


docker registry
![App Screenshot](images/image14.png)


![App Screenshot](images/image15.png)