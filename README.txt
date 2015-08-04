In order to setup a Fraud Detection System using WSO2 DAS please follow the instructions below.

1. Copy the wso2das-3.0.0-SNAPSHOT folder in this repository to your local machine

2. Create a MySQL database named 'fraud' with root/root credentials and apply the 'frauddump.sql' 

3. Copy 'fraud-detection-toolbox' from https://github.com/thusithak/fraud-detection-toolbox/ and Copy it to wso2das-3.0.0-SNAPSHOT/repository/deployment/server/jaggeryapps/

4. Run wso2server.bat [windows] or wso2server.sh [linux/mac] from wso2das-3.0.0-SNAPSHOT/bin to start the server

5. Access the Fraud Detection UI from http://localhost:9763/fraud-detection-toolbox/index.jag

6. Run ant from wso2das-3.0.0-SNAPSHOT/samples/transactions to publish some transactions to the Fraud Detection Toolbox
