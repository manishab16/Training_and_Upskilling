import psutil
import platform
import time
import os

def check_cpu():
    cpu_usage = psutil.cpu_percent(interval=1)
    return f"CPU Usage: {cpu_usage}%"

def check_memory():
    memory = psutil.virtual_memory()
    return f"Memory Usage: {memory.percent}% (Used: {memory.used // (1024*1024)} MB / Total: {memory.total // (1024*1024)} MB)"

def check_disk():
    disk = psutil.disk_usage('/')
    return f"Disk Usage: {disk.percent}% (Free: {disk.free // (1024*1024*1024)} GB)"

def check_uptime():
    boot_time = psutil.boot_time()
    uptime_seconds = time.time() - boot_time
    uptime_hours = int(uptime_seconds // 3600)
    return f"System Uptime: {uptime_hours} hours"

def check_network():
    response = os.system("ping -c 1 google.com > /dev/null 2>&1" if platform.system() != "Windows" else "ping -n 1 google.com >nul")
    return "Network: Connected" if response == 0 else "Network: Not Reachable"

def system_health_check():
    print("\n====== SYSTEM HEALTH CHECK ======\n")
    print(check_cpu())
    print(check_memory())
    print(check_disk())
    print(check_uptime())
    print(check_network())
    print("\n=================================\n")

system_health_check()

