What is DNS?
- Domain Name System which translates the human friendly hostnames into the machine IP addresses
- www.google.com => 172.217.18.36
- DNS is the backbone of the Internet
- DNS uses hierarchical naming structure
.com
.example.com
www.example.com


DNS Terminologies
- Domain Registrar: Amazon Route 53, GoDaddy, …
- DNS Records: A, AAAA, CNAME, NS, …
- Zone File: contains DNS records
- Name Server: resolves DNS queries (Authoritative or Non-Authoritative)
- Top Level Domain (TLD): .com, .us, .in, .gov, .org,
- Second Level Domain (SLD): amazon.com, google.com


Amazon Route 53
- A highly available, scalable, fully managed and Authoritative DNS
- Authoritative = the customer (you) can update the DNS records 
- Route 53 is also a Domain Registrar
- Ability to check the health of your resources
- The only AWS service which provides 100% availability SLA

Route 53 – Record Types
- A – maps a hostname to IPv4
- AAAA – maps a hostname to IPv6
- CNAME – maps a hostname to another hostname
- The target is a domain name which must have an A or AAAA record
- Can’t create a CNAME record for the top node of a DNS namespace (Zone Apex)
- Example: you can’t create for example.com, but you can create for www.example.com
- NS – Name Servers for the Hosted Zone
    - Control how traffic is routed for a domain


Route 53 – Hosted Zones
- Public Hosted Zones – contains records that specify how to route traffic on the Internet (public domain names)
    -application1.mypublicdomain.com
- Private Hosted Zones – contain records that specify how you route traffic within one or more VPCs (private domain names)
    -application1.company.internal

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


![App Screenshot](images/image17.png)


![App Screenshot](images/image18.png)


![App Screenshot](images/image19.png)


![App Screenshot](images/image20.png)


![App Screenshot](images/image21.png)


![App Screenshot](images/image22.png)


Route 53 – Records TTL (Time To Live)
- High TTL – e.g., 24 hr
- Less traffic on Route 53
- Possibly outdated records
- Low TTL – e.g., 60 sec.
- More traffic on Route 53 ($$)
- Records are outdated for less time
- Easy to change records
![App Screenshot](images/image23.png)


![App Screenshot](images/image24.png)



CNAME vs Alias
- AWS Resources (Load Balancer, CloudFront...) expose an AWS hostname: 
- lb1-1234.us-east-2.elb.amazonaws.com and you want myapp.mydomain.com 
- CNAME:
    - Points a hostname to any other hostname. (app.mydomain.com => blabla.anything.com)
    - ONLY FOR NON ROOT DOMAIN (aka. something.mydomain.com) 
- Alias: 
    - Points a hostname to an AWS Resource (app.mydomain.com => blabla.amazonaws.com) 
    - Works for ROOT DOMAIN and NON ROOT DOMAIN (aka mydomain.com) 
    - Free of charge 
    - Native health check


Route 53 – Alias Records
- Maps a hostname to an AWS resource
- An extension to DNS functionality
- Automatically recognizes changes in the resource’s IP addresses   

![App Screenshot](images/image25.png)


![App Screenshot](images/image26.png)


![App Screenshot](images/image27.png)

Alias
![App Screenshot](images/image28.png)


![App Screenshot](images/image29.png)


![App Screenshot](images/image30.png)


Health checks
![App Screenshot](images/image31.png)


![App Screenshot](images/image32.png)


![App Screenshot](images/image33.png)