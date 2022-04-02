1. Configure AWS CLI
    # Before starting, lets make sure you have AWS CLI installed on your system.
    # To check that, run the following command

    aws --version

    # If you get "Command aws not found" you need to install AWS by running this command

    sudo apt install awscli

    # Once you have AWSCLI installed run

    aws configure

    # To configure the Access Key and Secret Key, which are required to use CLI
    # If you don't have this credentials yet, follow the steps below:

    # Open the AWS Management Console, and click on My Security Credentials in your account's menu.
    # The following page will be shown, where you can go to Access keys section and Create New Access Key as shown below.
    # You may download the credentials and keep them in a safe location on your system, as you won't be able to look at the Secret Access Key again once you close the dialog box as shown in the previous # image. In case you've lost your keys, you can create new access keys by repeating the same steps as above.

    # Run 

    aws configure 

    # And enter the key generated on the previous step

    aws cloudformation describe-stacks

    aws cloudformation validate-template --template-body file://template1.yml

    # Create Key pair

    aws ec2 create-key-pair --key-name PolkaNodeKey --query 'KeyMaterial' --output text > PolkaNodeKey.pem

    aws ec2 describe-key-pairs

    # Check the .pem file access

    ls -l

    # to change the key file access to only us

    chmod 400 PolkaNodeKey.pem
    

    # Create the Stack

    aws cloudformation create-stack --stack-name PolkaNodeCS --template-body file://template1.yml --parameters ParameterKey=PolkaNodeKey,ParameterValue=PolkaNodeKey

    # Check the stack process

    aws cloudformation describe-stacks

    # If there is any error, use the following to check logs

    aws cloudformation describe-stack-events --stack-name PolkaNodeCS

    # Generate key

    ssh-keygen -t rsa -f my_key

    # to change the key file access to only us

    chmod 400 my_key.pub

    # Connect to the just created EC2

    aws ec2-instance-connect send-ssh-public-key \
    --availability-zone ap-south-1 \
    --instance-id i-0d348e539783a1daf \
    --instance-os-user ec2-user \
    --ssh-public-key file://my_key.pub

    # Connect to EC2

    
    ssh -o "IdentitiesOnly=yes" -i PolkaNodeKey.pem ec2-user@ec2-43-204-37-34.ap-south-1.compute.amazonaws.com
    ssh -o "IdentitiesOnly=yes" -i my_key.pub ec2-user@ec2-43-204-37-34.ap-south-1.compute.amazonaws.com
    ssh -o file://PolkaNodeKey1.pem ec2-user@3.110.159.107

    3.110.159.107







    

    # Check the just created stacks to check the newely created instance ID

    aws cloudformation describe-stacks

    # grab the instance id an connect to it

    aws ec2 associate-address --instance-id i-0dd5b1acd93baaca9 --public-ip 198.51.100.0

    aws ec2 associate-address --instance-id i-0dd5b1acd93baaca9 --allocation-id eipalloc-64d5890a






    ssh -o "IdentitiesOnly=yes" -i PolkaNodeKey ec2-user@ec2-198-51-100-1.compute-1.amazonaws.com





    

    mssh 'Instance-ID'

