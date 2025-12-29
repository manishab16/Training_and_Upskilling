def analyze_instance(instance):
    """
    Simple AI placeholder logic:
    Marks instance as EOS-risk if stopped
    """
    state = instance.get("state", "")

    if state == "stopped":
        return "EOS_RISK"
    return "ACTIVE"