import boto3

def fetch_aws_instances():
    ec2 = boto3.client("ec2")
    response = ec2.describe_instances()

    instances = []

    for reservation in response["Reservations"]:
        for instance in reservation["Instances"]:
            instances.append({
                "instance_id": instance["InstanceId"],
                "region": ec2.meta.region_name,
                "state": instance["State"]["Name"],
                "ip_address": instance.get("PublicIpAddress", "N/A"),
            })

    return instances