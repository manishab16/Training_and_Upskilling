EKS-Storage-with-RDS-Database
-Create DB Security Group
-Create security group to allow access for RDS Database on port 3306
- Security group name: eks_rds_db_sg
- Description: Allow access for RDS Database on Port 3306
- VPC: eksctl-eksdemo1-cluster/VPC

Inbound Rules
Type: MySQL/Aurora
Protocol: TPC
Port: 3306
Source: Anywhere (0.0.0.0/0)
Description: Allow access for RDS Database on Port 3306
Outbound Rules
Leave to defaults
![App Screenshot](images/image1.png)


- Create DB Subnet Group in RDS
- Go to RDS -> Subnet Groups
-Click on Create DB Subnet Group
- Name: eks-rds-db-subnetgroup
-Description: EKS RDS DB Subnet Group
-VPC: eksctl-eksdemo1-cluster/VPC
-Availability Zones: us-east-1a, us-east-1b
-Subnets: 2 subnets in 2 AZs
-Click on Create
![App Screenshot](images/image2.png)

CreateRDS database
![App Screenshot](images/image3.png)

![App Screenshot](images/image4.png)


![App Screenshot](images/image5.png)

![App Screenshot](images/image6.png)


![App Screenshot](images/image7.png)

![App Screenshot](images/image8.png)


![App Screenshot](images/image9.png)


![App Screenshot](images/image10.png)


-Edit Database Security to Allow Access from 0.0.0.0/0
    - Go to EC2 -> Security Groups -> eks-rds-db-securitygroup
    -Edit Inboud Rules
    -Source: Anywhere (0.0.0.0/0) (Allow access from everywhere for now)


Create Kubernetes externalName service Manifest and Deploy
- Deploy Manifest
- kubectl apply -f kube-manifests/01-MySQL-externalName-Service.yml
![App Screenshot](images/image11.png)

Connect to RDS Database using kubectl and create usermgmt schema/db
mysql> show schemas;
mysql> create database usermgmt;
mysql> show schemas;
mysql> exit
![App Screenshot](images/image12.png)


![App Screenshot](images/image13.png)


In User Management Microservice deployment file change username from root to dbadmin
- 02-UserManagementMicroservice-Deployment-Service.yml
Deploy User Management Microservice and Test
# Deploy all Manifests
kubectl apply -f kube-manifests/

# List Pods
kubectl get pods

# Stream pod logs to verify DB Connection is successful from SpringBoot Application
kubectl logs -f <pod-name>
![App Screenshot](images/image14.png)

kubectl get nodes -o wide


