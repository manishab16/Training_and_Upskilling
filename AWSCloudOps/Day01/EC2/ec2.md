launch ec2
![App Screenshot](images/image1.png)

![App Screenshot](images/image2.png)


Changing EC2 Instance Type
- Stop the instance
- Instance Settings => Change Instance Type 
- Start Instanc
![App Screenshot](images/image3.png)

stop instance
Changing EC2 Instance Type
![App Screenshot](images/image4.png)

Changing EC2 Instance Type
![App Screenshot](images/image5.png)

![App Screenshot](images/image6.png)

![App Screenshot](images/image7.png)

![App Screenshot](images/image8.png)

Placement Groups
- Sometimes you want control over the EC2 Instance placement strategy
- That strategy can be defined using placement groups
- When you create a placement group, you specify one of the following 
strategies for the group:
- Cluster—clusters instances into a low-latency group in a single Availability Zone
- Spread—spreads instances across underlying hardware (max 7 instances per group per AZ) – critical applications
- Partition—spreads instances across many different partitions (which rely on different sets of racks) within an AZ. Scales to 100s of EC2 instances per group (Hadoop, Cassandra, Kafka)


Placement group
![App Screenshot](images/image9.png)

![App Screenshot](images/image10.png)

![App Screenshot](images/image11.png)

![App Screenshot](images/image12.png)


CloudWatch Metrics for EC2
AWS Provided metrics (AWS pushes them):
- Basic Monitoring (default): metrics are collected at a 5 minute internal
- Detailed Monitoring (paid): metrics are collected at a 1 minute interval
- Includes CPU, Network, Disk and Status Check Metrics

Custom metric (yours to push):
- Basic Resolution: 1 minute resolution
- High Resolution: all the way to 1 second resolution
- Include RAM, application level metrics
- Make sure the IAM permissions on the EC2 instance role are correct !

![App Screenshot](images/image13.png)

![App Screenshot](images/image14.png)



Unified CloudWatch Agent
- For virtual servers (EC2 instances, on-premises servers)
- Collect additional system-level metrics such as RAM, processes, used disk space, etc
- Collect logs to send to CloudWatch Logs
    - No logs from inside your EC2 instance will be sent to 
    - CloudWatch Logs without using an agent

 create IAM role
![App Screenshot](images/image15.png)   

![App Screenshot](images/image16.png)

![App Screenshot](images/image17.png)

![App Screenshot](images/image18.png)

Create ec2
![App Screenshot](images/image19.png)

![App Screenshot](images/image20.png)

![App Screenshot](images/image21.png)

![App Screenshot](images/image22.png)

![App Screenshot](images/image23.png)


![App Screenshot](images/image24.png)

![App Screenshot](images/image25.png)

![App Screenshot](images/image26.png)


![App Screenshot](images/image27.png)


![App Screenshot](images/image28.png)

![App Screenshot](images/image29.png)

![App Screenshot](images/image30.png)

![App Screenshot](images/image31.png)

![App Screenshot](images/image32.png)

![App Screenshot](images/image33.png)

![App Screenshot](images/image34.png)

Status Checks
- Automated checks to identify hardware and software issues
- System Status Checks
    - Monitors problems with AWS systems (software/hardware issues on the physical host, loss of system power,)
    - Check Personal Health Dashboard for any scheduled critical maintenance by AWS to your instance’s host
    - Resolution: stop and start the instance (instance migrated to a new host)
- Instance Status Checks
    - Monitors software/network configuration of your instance (invalid network configuration, exhausted memory, …)
    - Resolution: reboot the instance or change instance configuration
- Attached EBS Status Checks
    - Monitors EBS volumes attached to your instance (reachable & complete I/O Operations)
    - Resolution: reboot the instance or replace affected EBS volumes

![App Screenshot](images/image35.png)

![App Screenshot](images/image36.png)

![App Screenshot](images/image37.png)


![App Screenshot](images/image38.png)


![App Screenshot](images/image39.png)

![App Screenshot](images/image40.png)


Instance Scheduler on AWS
- AWS solution deployed through CloudFormation (not a service)
- Automatically start/stop your AWS services to reduce costs (up to 70%)
- Example: stop company’s EC2 instances outside business hours
- Supports EC2 instances, EC2 Auto Scaling Groups, and RDS instances