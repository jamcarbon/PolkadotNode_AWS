Deploy a Polkadot Node on AWS (Ubuntu Server EC2) using Cloudformation and Docker.

Prerequisites

    1. AWS account
    2. Linux (for executing AWS CLI)

Configuration Steps

1. Generate Global Key
    Before starting, we need to connect to our newely created AWS account via CLI, for that we need access key and secret key.
    To configure the Access Key and Secret Key, which are required to use CLI
    If you don't have this credentials yet, follow the steps below:

    Open the AWS Management Console, and click on My Security Credentials in your account's menu.
    The following page will be shown, where you can go to Access keys section and Create New Access Key as shown below.
    You may download the credentials and keep them in a safe location on your system, as you won't be able to look at the Secret Access Key again once you close the dialog box as shown in the previous image. In case you've lost your keys, you can create new access keys by repeating the same steps as above. 

    (If you already have setup AWS on your system, to automate the whole process. clone this repo and run these:

    cd PolkadotNode_AWS

    sudo chmod 774 DeployCloudformation.sh

    ./DeployCloudformation.sh

    (wait 5 minutes and run: to check the ip, and skip to step 4)

    aws cloudformation describe-stacks

   
2. Configure AWS CLI

    Lets make sure you have AWS CLI installed on your system.
    To check that, run the following command

    aws --version

    If you get "Command aws not found" you need to install AWS by running this command

    sudo apt install awscli

    configure aws and select your convinient availability zone, I used ap-south-1

    aws configure


3. Clone this repository

    git clone https://github.com/jamcarbon/PolkadotNode_AWS

    cd PolkadotNode_AWS

    
4. Deploy stack

    Check if there is any stack created and check the template to create the new stack

    aws cloudformation describe-stacks

    aws cloudformation validate-template --template-body file://CreatePolkaNodeCloudStack.yml

    Create Key Pair

    aws ec2 create-key-pair --key-name PNK --query 'KeyMaterial' --output text > PNK.pem

    Check the newly created key

    aws ec2 describe-key-pairs

    Check the .pem file access

    ls -l

    to change the key file access to only us

    chmod 400 PNK.pem
    
    Create the Stack, it will take couple of minutes to create it

    aws cloudformation create-stack --stack-name PolkaNodeCloudStack --template-body file://CreatePolkaNodeCloudStack.yml --parameters ParameterKey=PNK,ParameterValue=PNK 

    Check the stack process and the IP of the newely created instance

    aws cloudformation describe-stacks

    If there is any error, use the following to check events

    aws cloudformation describe-stack-events --stack-name PolkaNodeCloudStack

4. Connect to the instance

    Connect to the instance using the IP, I recommend connecting using Termius, it is good to manage multiple connections at the same time, you can install it by running 

    sudo snap install termius-app

    or run

    ssh -i "PNK.pem" ubuntu@PolkadotFullNodeEC2.PublicIp


5. Install Docker
    After connecting we need to install Docker, for that clone the repository into the server

    git clone https://github.com/jamcarbon/PolkadotNode_AWS

    cd PolkadotNode_AWS

    sudo chmod 774 InstallDocker.sh

    ./Install_Docker.sh

6. Deploy Polkadot Full Node

    and at last run the installation of the Docker image that contains all the packages required for running Polkadot Node
    you can change the name of the node, for this example is "jamcarbon_PokadotFullNode"

    sudo chmod 774 InstallPolkadotNode.sh

    ./InstallPolkadotNode.sh


7. Test
    Finally test if the node is showing in the Telemetry "jamcarbon_PokadotFullNode"

    https://telemetry.polkadot.io/


