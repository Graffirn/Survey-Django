# Django Survey Webapp

1. Setup environment:

    ```
    conda env create -f survey.yml
    ```
    In Pycharm, ```File/Setting/Project: Survey/Porject Interpreter``` then click setting icon, select "Add...".<br>
    In the left-hand panel of the Add Python Interpreter dialog box, select Virtualenv Environment/Existing Environment.<br>
    Click "..." then direct to .../envs/survey/bin/python 
2. Create database:

    Create database:

    ```
    CREATE DATABASE survey;
    mysql -u username -p survey < survey.sql;
    ```
    Change ```USER``` and ```PASSWORD``` in DATABASES setting in survey/survey/settings.py
