# PART 1: Dashboard NYC Taxi Trip 2019 

<details>
<summary> <b>Dashboard<b> </summary>

1. 

</details>

<details>
<summary> <b>Summary Report<b> </summary>

1. 

</details>

___

# PART 2: Step by Step Installation Guide of PySpark

<details>
<summary> <b>1. Java Installation<b> </summary>

- Download and Run Installer Java Development Kit (JDK) at https://www.oracle.com/java/technologies/javase-jdk13-downloads.html

    ![Run Installer Java](image.jpg)

- Add the Java Path in "Edit the system environment variables"

    ![Add Java Path](image.jpg)

- Select Advanced → Click Environment Variables

    ![Environment Variables](image.jpg)

- At system variables, click button new. Then, fill with:

      1. Variable name: JAVA_HOME
      2. Variable value: C:\Program Files\Java\jdk-19
      
    ![Java System Variables](image.jpg)

- At user variables, select path and click button new. Then, fill with:

      1. Variable name: PATH
      2. Variable value: C:\Program Files\Java\jdk-19\bin

    ![Java User Variables](image.jpg)
      
- Open "Command Prompot" and check version using 
      ```
      java --version
      ```
      
    ![Java cmd](image.jpg)

</details>

<details>
<summary> <b>2. Python Installation<b> </summary>

- Download and Run Installer Python at https://www.python.org/downloads/
- Klik to Add Python _._ the Python Path

    ![Add Python Path](image.jpg)

- Open "Command Prompt" and check version using
      ```
      python --version
      ```
      
    ![Python cmd](image.jpg)

</details>

<details>
<summary> <b>3. PySpark Setup<b> </summary>

- Go to https://spark.apache.org/downloads.html
    ![PySpark](image.jpg)
- Download the .tgz file 
- Make a new folder called 'spark' in the C directory and extract the .tgz file.
  
</details>

<details>
<summary> <b>4. winutils Setup<b> </summary>

- Go to https://github.com/steveloughran/winutils/blob/master/hadoop-3.0.0/bin/winutils.exe
- Download the .exe file corresponds to the hadoop version on pyspark.
- Make a new folder called 'winutils' and inside of it make a new folder called 'bin'. Then put the .exe file.
- Add the Hadoop & Spark Path in "Edit the system environment variables"
- Select Advanced → Click Environment Variables
- At user variables, click button new. Then, fill with:

      1. Variable name: spark_home
      2. Variable value: C:\spark
      
- At user variables, select path and click button new. Then, fill with:

      1. Variable name: hadoop_home
      2. Variable value: C:\winutils
      
- Double click the path, click button new and add %Spark_Home%\bin
- Open "Command Prompot" and then type
      ```
      pyspark
      ```

    ![PySpark cmd](image.jpg)
      
</details>

