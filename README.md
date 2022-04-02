# Deploy a Polkadot Node on AWS (Ubuntu Server EC2) using Cloudformation and Docker.

# Prerequisites

# 1. AWS account
# 2. Linux (for executing AWS CLI)

# Configuration Steps

1. Generate Global Key
    # Before starting, we need to connect to our newely created AWS account via CLI, for that we need access key and secret key.
    # To configure the Access Key and Secret Key, which are required to use CLI
    # If you don't have this credentials yet, follow the steps below:

    # Open the AWS Management Console, and click on My Security Credentials in your account's menu.
    # The following page will be shown, where you can go to Access keys section and Create New Access Key as shown below.
    # You may download the credentials and keep them in a safe location on your system, as you won't be able to look at the Secret Access Key again once you close the dialog box as shown in the previous image. In case you've lost your keys, you can create new access keys by repeating the same steps as above. 

2. Configure AWS CLI

    # Lets make sure you have AWS CLI installed on your system.
    # To check that, run the following command

    aws --version

    # If you get "Command aws not found" you need to install AWS by running this command

    sudo apt install awscli

    # Once you have AWSCLI installed run, and enter the key generated on the previous step, you can do that by telling cli where the key is located "file://PolkaNodeKey.pem"

    aws configure
    # Clone this repository

    git clone https://github.com/jamcarbon/PolkadotNode_AWS

    # Check if there is any stack created and check the template to create the new stack

    aws cloudformation describe-stacks

    aws cloudformation validate-template --template-body file://CreatePolkaNodeCloudStack.yml

    # Copy the Global Key (.pem) to the folder and check the key

    aws ec2 describe-key-pairs

    # Check the .pem file access

    ls -l

    # to change the key file access to only us

    chmod 400 PolkaNodeKey.pem
    
    # Create the Stack

    aws cloudformation create-stack --stack-name PolkaNodeCloudStack --template-body file://CreatePolkaNodeCloudStack.yml --parameters ParameterKey=PolkaNodeKey,ParameterValue=PolkaNodeKey

    # Check the stack process and the IP of the newely created instance

    aws cloudformation describe-stacks

    # If there is any error, use the following to check events

    aws cloudformation describe-stack-events --stack-name PolkaNodeCloudStack


    # Connect to the instance using the IP, I recommend connecting using Terminus, it is good to manage multiple connections at the same time


    ssh -o file://PolkaNodeKey1.pem ec2-user@PolkadotFullNodeEC2.PublicIp



    # After connecting we need to install Docker, for that clone the repository into the server

    git clone https://github.com/jamcarbon/PolkadotNode_AWS

    ./Install_Docker.sh

    # and at last run the installation of the Docker image that contains all the packages required for running Polkadot Node
    # you can change the name of the node, for this example is "jamcarbon_PokadotFullNode"

    ./Install_Polkadot_Node.sh

    # Finally test if the node is showing in the Telemetry "jamcarbon_PokadotFullNode"

    https://telemetry.polkadot.io/


