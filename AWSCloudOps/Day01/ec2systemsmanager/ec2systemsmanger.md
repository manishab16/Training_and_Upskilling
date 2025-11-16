AWS Systems Manager Overview
- Helps you manage your EC2 and On-Premises systems at scale
- Get operational insights about the state of your infrastructure
- Easily detect problems
- Patching automation for enhanced compliance
- Works for both Windows and Linux OS
- Integrated with CloudWatch metrics / dashboards
- Integrated with AWS Config

Start EC2 Instances with SSM Agent
![App Screenshot](images/image1.png)

![App Screenshot](images/image2.png)

![App Screenshot](images/image3.png)

![App Screenshot](images/image4.png)

![App Screenshot](images/image5.png)

![App Screenshot](images/image6.png)

![App Screenshot](images/image7.png)

![App Screenshot](images/image8.png)

![App Screenshot](images/image9.png)

AWS Tags
- You can add text key-value pairs called Tags to many AWS resources
- Commonly used in EC2
- Free naming, common tags are Name, Environment, Team … 
- They’re used for
    - Resource grouping
    - Automation
    - Cost allocation

Resource Groups 
- Create, view or manage logical group of resources thanks to tags
- Allows creation of logical groups of resources such as 
    - Applications 
    - Different layers of an application stack 
    - Production versus development environment    

![App Screenshot](images/image10.png)  

![App Screenshot](images/image11.png)

![App Screenshot](images/image12.png)

![App Screenshot](images/image13.png)

![App Screenshot](images/image14.png)

![App Screenshot](images/image15.png)


SSM – Documents
- Documents can be in JSON or YAML 
- You define parameters 
- You define actions 
- Many documents already exist in AWS

SSM – Run Command
- Execute a document (= script) or just run a command
- Run command across multiple instances (using resource groups)
- Rate Control / Error Control
- Integrated with IAM & CloudTrail
- No need for SSH
- Command Output can be shown in the Console, sent to S3 bucket or CloudWatch Logs

SSM Documents & SSM Run Command
![App Screenshot](images/image16.png)

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

![App Screenshot](images/image27.png)

![App Screenshot](images/image28.png)


SSM Automations
- Simplifies common maintenance and deployment tasks of EC2 instances and other AWS resources
- Example: restart instances, create an AMI, EBS snapshot
- Automation Runbook
    - SSM Documents of type Automation
    - Defines actions performed on your EC2 instances or AWS resources
    - Pre-defined runbooks (AWS) or create custom runbooks
Can be triggered
- Manually using AWS Console, AWS CLI or SDK
- By Amazon EventBridge
- On a schedule using Maintenance Windows
- By AWS Config for rules remediations    

![App Screenshot](images/image29.png)

![App Screenshot](images/image30.png)

![App Screenshot](images/image31.png)

![App Screenshot](images/image32.png)

![App Screenshot](images/image33.png)

![App Screenshot](images/image34.png)


SSM Parameter Store
- Secure storage for configuration and secrets
- Optional Seamless Encryption using KMS
- Serverless, scalable, durable, easy SDK
- Version tracking of configurations / secrets
- Security through IAM
- Notifications with Amazon EventBridge
- Integration with CloudFormation

SSM Parameter Store Hierarchy
- /my-department/
    - my-app/
        -dev/
            - db-url
            - db-password
        - prod/
            - db-url
            - db-password
    - other-app/        
