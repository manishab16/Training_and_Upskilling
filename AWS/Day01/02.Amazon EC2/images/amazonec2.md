Amazon EC2 –
- EC2 is one of the most popular of AWS’ offering
- EC2 = Elastic Compute Cloud = Infrastructure as a Service
- It mainly consists in the capability of : 
1. Renting virtual machines (EC2) 
2. Storing data on virtual drives (EBS) 
3. Distributing load across machines (ELB) 
4. Scaling the services using an auto-scaling group (ASG)


EC2 sizing & configuration options 
- Operating System (OS): Linux, Windows or Mac OS 
- How much compute power & cores (CPU)
- How much random-access memory (RAM) 
- How much storage space:  
1. Network-attached (EBS & EFS) 
2. hardware (EC2 Instance Store)
- Network card: speed of the card, Public IP address 
- Firewall rules: security group 
- Bootstrap script (configure at first launch): EC2 User Data



EC2 User Data 
- It is possible to bootstrap our instances using an EC2 User data script. 
- bootstrapping means launching commands when a machine starts 
- That script is only run once at the instance first start 
- EC2 user data is used to automate boot tasks such as: 
- Installing updates 
- Installing software
 1. Downloading common files from the internet
 	- Anything you can think of 
- The EC2 User Data Script runs with the root use



Launching an EC2 Instance running Linux
Create keypair
![App Screenshot](images/image22.png)



![App Screenshot](images/image23.png)



Add userdata