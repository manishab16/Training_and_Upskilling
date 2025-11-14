SSM – Fleet Manager
- Centrally & remotely manage your nodes running on AWS or on-premises
- Including EC2 instances, on-premises servers / VMs, edge devices, IoT devices
- Supports different OS (Windows, Linux)
- All nodes must be have the SSM agent installed


Systems Manager Default Host Management Configuration
-When enabled, it automatically configure your EC2 instances as managed instances without the use of EC2 Instance Profile
- Instance Identity Role – a type of IAM Role with no permissions beyond identifying the EC2 instance to AWS Services (e.g., Systems Manager
- Automatically enables Session Manager, Patch Manager, and Inventory


SSM – Inventory
- Collect metadata from your managed instances (EC2/On-premises)
- Metadata includes installed software, OS drivers, configurations, installed updates, running services


SSM – State Manager
- Automate the process of keeping your managed instances (EC2/On-premises) in a state that you define
- Use cases: bootstrap instances with software, patch OS/software updates on a schedule
- State Manager Association:
    - Defines the state that you want to maintain to your managed instances
    - Example: port 22 must be closed, antivirus must be installed
    - Specify a schedule when this configuration is applied
    - Uses SSM Documents to create an Association (e.g., SSM Document to configure CW Agent)


SSM – Patch Manager
• Automates the process of patching managed instances
• OS updates, applications updates, security updates, …
• Supports both EC2 instances and on-premises servers
• Supports Linux, macOS, and Windows

![App Screenshot](images/image1.png)


![App Screenshot](images/image2.png)


![App Screenshot](images/image3.png)


![App Screenshot](images/image4.png)



![App Screenshot](images/image5.png)


![App Screenshot](images/image6.png)


![App Screenshot](images/image7.png)


![App Screenshot](images/image8.png)


![App Screenshot](images/image9.png)


![App Screenshot](images/image10.png)


![App Screenshot](images/image11.png)


![App Screenshot](images/image12.png)


![App Screenshot](images/image13.png)


![App Screenshot](images/image14.png)


![App Screenshot](images/image15.png)

![App Screenshot](images/image16.png)

SSM – Distributor
- Package and deploy software to your managed instances
- You create a Distributor Package (SSM Document) and deploy to different platforms (Windows, Linux)
- Distributor Package 
- Contents stored in S3
- Zip file per target OS platform (install script, uninstall script, executable file)
- JSON manifest file that describes the package content
- Use AWS-provided packages, 3rd party packages, or create your own package


Systems Manager – OpsCenter
- Allows you to view, investigate, and remediate issues in one place (no need to navigate across different AWS services)
- Security issues (Security Hub), performance issues (DynamoDB throttle), failures (ASG failed launch instance)...
- Reduce meantime to resolve issues
- OpsItems
    - Operational issue or interruption that needs investigation and remediation
    - Event, resource, AWS Config changes, CloudTrail logs, EventBridge...
    - Provides recommended Runbooks to resolve the issue
- Supports both EC2 instances and on-premises managed nodes
