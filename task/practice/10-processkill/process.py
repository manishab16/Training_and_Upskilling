import psutil
import time
import logging

logging.basicConfig(
    filename="/home/ec2-user/cpu_monitor.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

CPU_THRESHOLD = 40   # Kill only if usage > 40%
SAFE_PROCESSES = ["python", "node", "java", "gunicorn", "mysqld", "nginx"]

for p in psutil.process_iter():
    p.cpu_percent(interval=None)

time.sleep(1)  # sampling interval

max_cpu = 0
target_proc = None

for p in psutil.process_iter(['pid', 'name']):
    try:
        usage = p.cpu_percent()
        if usage > max_cpu:
            max_cpu = usage
            target_proc = p
    except (psutil.NoSuchProcess, psutil.AccessDenied):
        continue


if target_proc:
    pname = target_proc.name().lower()
    logging.info(f"Highest CPU: {pname} ({max_cpu}%) PID={target_proc.pid}")

    print(f"Process consuming most CPU: {target_proc.pid} - {pname} ({max_cpu}%)")

    if max_cpu > CPU_THRESHOLD:
        if any(s in pname for s in SAFE_PROCESSES):
            print(f"⚠️ Killing process {target_proc.pid} ({pname})")
            logging.warning(f"Killed process: {pname} PID={target_proc.pid}, CPU={max_cpu}%")
            target_proc.kill()
        else:
            print("❗ Process looks system-critical. Not killing.")
            logging.warning(f"Skipped system-critical process: {pname} PID={target_proc.pid}")
    else:
        print("CPU usage below threshold — no action taken.")
