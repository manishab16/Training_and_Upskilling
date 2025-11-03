#Write a shell script to check to see if the file "/etc/shadow" exists. If it does exist, display "Shadow passwords are enabled."

#!/bin/bash

FILE="/etc/shadow"

if [ -e "$FILE" ]
then
  echo "Shadow passwords are enabled."
fi

if [ -w "$FILE" ]
then
  echo "You have permissions to edit ${FILE}."
else
  echo "You do NOT have permissions to edit ${FILE}."
fi

