import boto3
import os
import json

ec2 = boto3.client("ec2")

INSTANCE_ID = os.environ["INSTANCE_ID"]
SMALL_TYPE = os.environ["SMALL_TYPE"]
LARGE_TYPE = os.environ["LARGE_TYPE"]

def lambda_handler(event, context):
    print("Received event:", json.dumps(event))

    # EventBridge sends CloudWatch Alarm State Change events
    detail = event.get("detail", {})
    alarm_name = detail.get("alarmName")
    state = detail.get("state", {}).get("value")

    if state != "ALARM":
        print("State is not ALARM, nothing to do.")
        return {"status": "ignored", "reason": "state not ALARM"}

    print(f"Alarm {alarm_name} is in ALARM state.")

    # Decide direction based on alarm name
    if alarm_name.endswith("-cpu-high"):
        return scale_up()
    elif alarm_name.endswith("-cpu-low"):
        return scale_down()
    else:
        print("Unknown alarm, ignoring.")
        return {"status": "ignored", "reason": "unknown alarm"}

def get_instance_type():
    resp = ec2.describe_instances(InstanceIds=[INSTANCE_ID])
    itype = resp["Reservations"][0]["Instances"][0]["InstanceType"]
    print(f"Current instance type: {itype}")
    return itype

def scale_up():
    current_type = get_instance_type()
    if current_type == LARGE_TYPE:
        print("Already at LARGE_TYPE, not scaling up.")
        return {"status": "no-op", "reason": "already large"}

    print(f"Scaling UP instance {INSTANCE_ID} from {current_type} to {LARGE_TYPE}")
    return change_instance_type(LARGE_TYPE)

def scale_down():
    current_type = get_instance_type()
    if current_type == SMALL_TYPE:
        print("Already at SMALL_TYPE, not scaling down.")
        return {"status": "no-op", "reason": "already small"}

    print(f"Scaling DOWN instance {INSTANCE_ID} from {current_type} to {SMALL_TYPE}")
    return change_instance_type(SMALL_TYPE)

def change_instance_type(new_type):
    print(f"Stopping instance {INSTANCE_ID}")
    ec2.stop_instances(InstanceIds=[INSTANCE_ID])
    waiter = ec2.get_waiter("instance_stopped")
    waiter.wait(InstanceIds=[INSTANCE_ID])
    print(f"Instance {INSTANCE_ID} stopped.")

    print(f"Modifying instance type to {new_type}")
    ec2.modify_instance_attribute(
        InstanceId=INSTANCE_ID,
        InstanceType={"Value": new_type}
    )

    print(f"Starting instance {INSTANCE_ID}")
    ec2.start_instances(InstanceIds=[INSTANCE_ID])
    print("Instance started.")

    return {"status": "success", "new_type": new_type}
