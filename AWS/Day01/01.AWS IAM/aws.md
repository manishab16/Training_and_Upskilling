IAM
IAM = Identity and Access Management, Global service
- Root account created by default, shouldn’t be used or shared
- Users are people within your organization, and can be grouped
- Groups only contain users, not other groups
- Users don’t have to belong to a group, and user can belong to multiple groups


IAM user
- A user represents a single person or application that interacts with AWS.
- Each user has: A name
Credentials (password, access keys)
Permissions (granted via policies)

IAM group 
- A group is a collection of IAM users.
- You attach policies (permissions) to the group and all users in that group inherit those permissions.
- Example: A group named Developers has permission to manage EC2 instances. Every user added to Developers can automatically start/stop EC2.

IAM roles
- A role is an identity with permissions, but no permanent user credentials (no password or access key).
- example -
- An EC2 instance needs to upload logs to an S3 bucket — you assign an IAM role to the EC2 instance:
Role Name: EC2-S3-Access
Policy: Allow s3:PutObject on your bucket
Result: EC2 instance can upload logs securely without storing credentials.


IAM User
![App Screenshot](images/image.png)