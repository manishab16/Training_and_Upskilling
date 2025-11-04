# What is aws
- AWS stands for Amazon web services and it is a cloud provider.
- It provides you with servers and services that you can use on demand and scale easily.

# AWS Regions 
- AWS has Regions all around the world 
- Names can be us-east-1, eu-west-3
- Most AWS services are region-scope

# How to choose an AWS Region?
-Compliance with data governance and legal 
  - requirements: data never leaves a region without your explicit permission
- Proximity to customers: reduced latency
- Available services within a Region: new services and new features aren’t available in every Region
- Pricing: pricing varies region to region and is 
transparent in the service pricing pag


# AWS Availability Zones
- Each region has many availability zones (usually 3, min is 3, max is 6). Example: 
- ap-southeast-2a
- ap-southeast-2b
- ap-southeast-2c
- Each availability zone (AZ) is one or more discrete data centers with redundant power, networking, and connectivity


# AWS Points of Presence 
- Amazon has 400+ Points of Presence (400+ Edge Locations & 10+ Regional Caches) in 90+ cities across 40+ countrie


# AWS Console
- AWS has Global Services:
    - Identity and Access Management (IAM)
    - Route 53 (DNS service)
    - CloudFront (Content Delivery Network)
    - WAF (Web Application Firewall)
- Most AWS services are Region-scoped:
    - Amazon EC2 (Infrastructure as a Service)
    - Elastic Beanstalk (Platform as a Service)
    - Lambda (Function as a Service)
    - Rekognition (Software as a Service