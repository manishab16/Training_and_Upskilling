Scalability & High Availability
- Scalability means that an application / system can handle greater loads by adapting. 
- There are two kinds of scalability:
- Vertical Scalability
- Horizontal Scalability (= elasticity)
- Scalability is linked but different to High Availability

Vertical Scalability
- Vertically scalability means increasing the size of the instance
- For example, your application runs on a t2.micro
- Scaling that application vertically means running it on a t2.large
- Vertical scalability is very common for non distributed systems, such as a database.

Horizontal Scalability 
- Horizontal Scalability means increasing the number of instances / systems for your application
- Horizontal scaling implies distributed systems. • This is very common for web applications /modern applications

High Availability 
- High Availability usually goes hand in hand with horizontal scaling
- High availability means running your application / system in at least 2 data centers (== Availability Zones)
- The goal of high availability is to survive a data center loss
- The high availability can be passive (for RDS Multi AZ for example)
- The high availability can be active (for horizontal scaling)


What is load balancing?
- Load Balances are servers that forward traffic to multiple servers (e.g., EC2 instances) downstream


Why use a load balancer?
- Spread load across multiple downstream instances 
- Expose a single point of access (DNS) to your application 
- Seamlessly handle failures of downstream instances 
- Do regular health checks to your instances 
- Provide SSL termination (HTTPS) for your webs

Why use an Elastic Load Balancer?
- An Elastic Load Balancer is a managed load balancer
    - AWS guarantees that it will be working
    - AWS takes care of upgrades, maintenance, high availability
    - AWS provides only a few configuration knobs
-It costs less to setup your own load balancer but it will be a lot more effort on your end
- It is integrated with many AWS offerings / services
    - EC2, EC2 Auto Scaling Groups, Amazon ECS
    - AWS Certificate Manager (ACM), CloudWatch
    - Route 53, AWS WAF, AWS Global Accelerator


Health Checks
- Health Checks are crucial for Load Balancers
- They enable the load balancer to know if instances it forwards traffic to are available to reply to requests
- The health check is done on a port and a route (/health is common)
- If the response is not 200 (OK), then the instance is unhealthy


Types of load balancer on AWS
- AWS has 4 kinds of managed Load Balancers
- Classic Load Balancer (v1 - old generation) – 2009 – CLB
    - HTTP, HTTPS, TCP, SSL (secure TCP)
- Application Load Balancer (v2 - new generation) – 2016 – ALB 
    - HTTP, HTTPS, WebSocket
- Network Load Balancer (v2 - new generation) – 2017 – NLB 
    - TCP, TLS (secure TCP), UDP
- Gateway Load Balancer – 2020 – GWLB 
    - Operates at layer 3 (Network layer) – IP Protocol
- Some load balancers can be setup as internal (private) or external (public) ELBs
    


Application Load Balancer (v2)
- Application load balancers is Layer 7 (HTTP)
- Load balancing to multiple HTTP applications across machines (target groups)
- Load balancing to multiple applications on the same machine (ex: containers)
- Support for HTTP/2 and WebSocket
- Support redirects (from HTTP to HTTPS for example)

![App Screenshot](images/image17.png)


![App Screenshot](images/image18.png)


![App Screenshot](images/image19.png)


![App Screenshot](images/image20.png)


![App Screenshot](images/image21.png)


![App Screenshot](images/image22.png)


![App Screenshot](images/image23.png)


![App Screenshot](images/image24.png)

![App Screenshot](images/image25.png)

![App Screenshot](images/image26.png)

Network Load Balancer
    - Network load balancers (Layer 4) allow to:
    - Forward TCP & UDP traffic to your instances
    - Handle millions of request per seconds
    - Ultra-low latency
- NLB has one static IP per AZ, and supports assigning Elastic IP(helpful for whitelisting specific IP)    


Network Load Balancer –Target Groups
- EC2 instances
- IP Addresses – must be private IPs
- Application Load Balancer
- Health Checks support the TCP, HTTP and HTTPS Protocols


![App Screenshot](images/image27.png)


![App Screenshot](images/image28.png)


![App Screenshot](images/image29.png)


![App Screenshot](images/image30.png)


![App Screenshot](images/image31.png)


![App Screenshot](images/image32.png)


![App Screenshot](images/image33.png)


![App Screenshot](images/image34.png)


![App Screenshot](images/image35.png)


![App Screenshot](images/image36.png)


![App Screenshot](images/image37.png)


Gateway Load Balancer
- Deploy, scale, and manage a fleet of 3rd party network virtual appliances in AWS
- Example: Firewalls, Intrusion Detection and Prevention Systems, Deep Packet Inspection Systems, payload manipulation
- Operates at Layer 3 (Network Layer) – IP Packets
- Combines the following functions:
    - Transparent Network Gateway – single entry/exit for all traffic
    - Load Balancer – distributes traffic to your virtual appliances
- Uses the GENEVE protocol on port 6081


AWS CloudFormation
- CloudFormation is a declarative way of outlining your AWS Infrastructure, for any resources (most of them are supported)
- For example, within a CloudFormation template, you say:
    - I want a security group
    - I want two EC2 instances using this security group
    - I want two Elastic IPs for these EC2 instances
    - I want an S3 bucket
    - I want a load balancer (ELB) in front of these EC2 instances
- Then CloudFormation creates those for you, in the right order, with the exact configuration that you specify

![App Screenshot](images/image38.png)


![App Screenshot](images/image39.png)



Lamba
- Virtual functions – no servers to manage
- Limited by time - short executions
- Run on-demand
- Scaling is automated!

AWS Lambda Pricing: example
- Pay per calls
    - First 1,000,000 requests are free • $0.20 per 1 million requests thereafter ($0.0000002 per request)

![App Screenshot](images/image40.png)   


![App Screenshot](images/image41.png)


![App Screenshot](images/image42.png)


![App Screenshot](images/image43.png)


![App Screenshot](images/image44.png)


S3 Events Notifications
-   S3:ObjectCreated, S3:ObjectRemoved, 
    S3:ObjectRestore, S3:Replication
- Object name filtering possible (*.jpg)
- Use case: generate thumbnails of images 
- S3 event notifications typically deliver events in seconds but can sometimes take a minute or longer    



What’s an EBS Volume?
- An EBS (Elastic Block Store) Volume is a network drive you can attach to your instances while they run
- It allows your instances to persist data, even after their termination
- They can only be mounted to one instance at a time (at the CCP level)
- They are bound to a specific availability zone

EBS Volume
- It’s a network drive (i.e. not a physical drive)
- It uses the network to communicate the instance, which means there might be a bit of latency
- It can be detached from an EC2 instance and attached to another one quickly

![App Screenshot](images/image45.png)


![App Screenshot](images/image46.png)


![App Screenshot](images/image47.png)


![App Screenshot](images/image48.png)


![App Screenshot](images/image49.png)


EBS Volume Types
- EBS Volumes come in 6 types
- gp2 / gp3 (SSD): General purpose SSD volume that balances price and performance for a wide variety of workloads
- io1 / io2 Block Express (SSD): Highest-performance SSD volume for mission-critical low-latency or high-throughput workloads
- st1 (HDD): Low cost HDD volume designed for frequently accessed, throughput- intensive workloads
- sc1 (HDD): Lowest cost HDD volume designed for less frequently accessed workload


EBS Snapshots
- Make a backup (snapshot) of your EBS volume at a point in time
- Not necessary to detach volume to do snapshot, but recommended
- Can copy snapshots across AZ or Region

![App Screenshot](images/image50.png)


![App Screenshot](images/image51.png)


![App Screenshot](images/image52.png)


![App Screenshot](images/image53.png)


![App Screenshot](images/image54.png)



EBS vs EFS – Elastic Block Storage
EBS volumes
- one instance (except multi-attach io1/io2)
- are locked at the Availability Zone (AZ) level
- gp2: IO increases if the disk size increases
- gp3 & io1: can increase IO independently

- Mounting 100s of instances across AZ
- EFS share website files (WordPress)
- Only for Linux Instances (POSIX)
- EFS has a higher price point than EBS


