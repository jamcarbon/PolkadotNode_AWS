# Deploy a Polkadot Node on AWS using Cloudformation and Docker.

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

    # Once you have AWSCLI installed run

    aws configure

    # And enter the key generated on the previous step, you can do that by telling cli where the key is located "file://PolkaNodeKey.pem"

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

    ssh -i "PolkaNodeKey.pem" ubuntu@0.0.0.0



    # Install Polkadot Full Node

    # Determine the last version of Polkadot https://github.com/paritytech/polkadot/releases, at the time of writing, the latest version is v0.9.18

    sudo apt install curl

    curl -sL https://github.com/paritytech/polkadot/releases/download/v0.9.18/polkadot -o jamca_PolkaFullNode

    sudo chmod +x jamca_PolkaFullNode

    ./target/release/polkadot --name "jamca_PolkaFullNode"










    # Allocate IP address to your account

    




    # Connect to the just created EC2



    # Connect to EC2
    
    ssh -o "IdentitiesOnly=yes" -i PolkaNodeKey.pem ec2-user@ec2-43-204-37-34.ap-south-1.compute.amazonaws.com
    ssh -o "IdentitiesOnly=yes" -i my_key.pub ec2-user@ec2-43-204-37-34.ap-south-1.compute.amazonaws.com
    ssh -o "IdentitiesOnly=yes" -i my_key.pub root@3.109.214.32
    ssh -o "IdentitiesOnly=yes" -i PolkaNodeKey.pem ubuntu@3.109.214.32
    ssh -i "PolkaNodeKey.pem" ubuntu@ec2-3-109-214-32.ap-south-1.compute.amazonaws.com


    ssh -o PolkaNodeKey1.pem ec2-user@3.110.159.107
    ssh -o PolkaNodeKey.pem ec2-user@3.109.214.32
    ssh -o /my_key.pub ec2-user@3.109.214.32

    3.110.159.107







    

    # Check the just created stacks to check the newely created instance ID

    aws cloudformation describe-stacks

    # grab the instance id an connect to it

    aws ec2 associate-address --instance-id i-0dd5b1acd93baaca9 --public-ip 198.51.100.0

    aws ec2 associate-address --instance-id i-0dd5b1acd93baaca9 --allocation-id eipalloc-64d5890a






    ssh -o "IdentitiesOnly=yes" -i PolkaNodeKey ec2-user@ec2-198-51-100-1.compute-1.amazonaws.com





    

    mssh 'Instance-ID'







    

    mssh 'Instance-ID'

