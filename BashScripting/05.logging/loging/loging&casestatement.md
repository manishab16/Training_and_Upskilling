Case Statements

Practice Exercises – 

Case Statements Exercise 1: Create a startup script for an application called sleepwalkingserver, which is provided below. The script should be named sleepwalking and accept "start" and "stop" as arguments. If anything other than "start" or "stop" is provided as an argument, display a usage statement: "Usage sleepwalking start|stop" and terminate the script with an exit status of 1. To start sleepwalkingserver, use this command: "/tmp/sleepwalkingserver &" To stop sleepwalkingserver, use this command: "kill $(cat /tmp/sleepwalkingserver.pid)" Here is the contents of "sleepwalkingserver". Be sure to put this file in /tmp and run chmod 755 /tmp/sleepwalkingserver #!/bin/bash PID\_FILE="/tmp/sleepwalkingserver.pid" trap "rm $PID\_FILE; exit" SIGHUP SIGINT SIGTERM echo "$$" > $PID\_FILE while true do : done

![A computer screen shot of a black screen

AI-generated content may be incorrect.](Aspose.Words.c028c01c-4297-4c34-be11-398b0a75741e.001.png)












Logging

![A computer screen shot of white text

AI-generated content may be incorrect.](Aspose.Words.c028c01c-4297-4c34-be11-398b0a75741e.002.png)

![A screen shot of a computer

AI-generated content may be incorrect.](Aspose.Words.c028c01c-4297-4c34-be11-398b0a75741e.003.png)


Exercise 1:

Write a shell script that displays one random number to the screen and also generates a syslog message with that random number. Use the "user" facility and the "info" facility for your messages.

Hint: Use $RANDOM


![A screenshot of a computer

AI-generated content may be incorrect.](Aspose.Words.c028c01c-4297-4c34-be11-398b0a75741e.004.png)

Exercise 2:

Modify the previous script so that it uses a logging function. Additionally tag each syslog message with "randomly" and include the process ID. Generate 3 random numbers.

![A screen shot of a computer

AI-generated content may be incorrect.](Aspose.Words.c028c01c-4297-4c34-be11-398b0a75741e.005.png)








debuging

![A screen shot of a computer

AI-generated content may be incorrect.](Aspose.Words.c028c01c-4297-4c34-be11-398b0a75741e.006.png)


![](Aspose.Words.c028c01c-4297-4c34-be11-398b0a75741e.007.png)







