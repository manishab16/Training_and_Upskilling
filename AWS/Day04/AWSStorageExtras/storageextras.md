AWS Snowball
- Highly-secure, portable devices to collect and process data at the 
edge, and migrate data into and out of AWS

What is Edge Computing?
- Process data while it’s being created on an edge location
- A truck on the road, a ship on the sea, a mining station underground.
These locations may have limited internet and no access to computing power
- We setup a Snowball Edge device to do edge computing
- Snowball Edge Compute Optimized (dedicated for that use case) & Storage Optimized
- Run EC2 Instances or Lambda functions at the edge
- Use cases: preprocess data, machine learning, transcoding media

Amazon FSx – Overview 
- Launch 3rd party high-performance file systems on AWS
- Fully managed service

Hybrid Cloud for Storage
- AWS is pushing for ”hybrid cloud”
- Part of your infrastructure is on the cloud 
- Part of your infrastructure is on-premises
- This can be due to 
- Long cloud migrations
- Security requirements
- Compliance requirements
- IT strategy

AWS Storage Gateway
- Bridge between on-premises data and cloud data

Use cases:
- disaster recovery
- backup & restore
- tiered storage
- on-premises cache & low-latency files access
- Types of Storage Gateway:
- S3 File Gateway 
- Volume Gateway
- Tape Gateway

Amazon SQS – Standard Queue
- Oldest offering (over 10 years old)
- Fully managed service, used to decouple applications 
- Attributes:
- Unlimited throughput, unlimited number of messages in queue
- Default retention of messages: 4 days, maximum of 14 days
- Low latency (<10 ms on publish and receive)
- Limitation of 256KB per message sent


SQS – Producing Messages
- Produced to SQS using the SDK (SendMessage API)
- The message is persisted in SQS until a consumer deletes it
- Message retention: default 4 days, up to 14 days

SQS – Consuming Messages
- Consumers (running on EC2 instances, servers, or AWS Lambda)
- Poll SQS for messages (receive up to 10 messages at a time)
- Process the messages (example: insert the message into an RDS database)

Amazon Kinesis Data Streams 
- Collect and store streaming data in real-time

Kinesis Data Streams
- Retention between up to 365 days
- Ability to reprocess (replay) data by consumers
- Data can’t be deleted from Kinesis (until it expires)


