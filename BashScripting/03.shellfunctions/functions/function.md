Function 

Positional parameters

1\.functionas can accept parameters

2\.the first parameter is stored in $1

3\.the second parameter is stored in $2 etc

4\.$@ contains all of the parameters

5\.just like shell scripts

`  `$0 = the script itself , not function name

Script1

![A screen shot of a computer

AI-generated content may be incorrect.](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.001.png)

Script2

![A computer screen shot of a black screen

AI-generated content may be incorrect.](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.002.png)

Script3

![A screen shot of a computer

AI-generated content may be incorrect.](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.003.png)

Script4

![A computer screen shot of a black screen

AI-generated content may be incorrect.](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.004.png)

Script5

![A screen shot of a computer

AI-generated content may be incorrect.](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.005.png)

Script 6

![A screen shot of a computer

AI-generated content may be incorrect.](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.006.png)

**Script7**

![A screenshot of a computer program

AI-generated content may be incorrect.](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.007.png)

![](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.008.png)












**Exercise 1:**

**Write a shell script that consists of a function that display the number of files in the present working directory. Name this function "file\_count" and call it in your script. If you use a variable in your function, remember to make it a local variable.**

**Hint: The wc utility is used to count the number of lines, words, and bytes.** 

![](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.009.png)


**Exercise 2:**

**Modify the script from the previous exercise. Make the "file\_count" function accept a directory as an argument. Next have the function display the name of the directory followed by a colon. Finally, display the number of files to the screen on the next line. Call the function three times. First, on the "/etc" directory, next on the "/var" directory and finally on the "/usr/bin" directory.**

**Example output:**

1. **/etc:**
1. **85**

![A computer screen shot of a black screen

AI-generated content may be incorrect.](Aspose.Words.b9a02071-4163-4aec-8adc-15ee3538b4f6.010.png)











