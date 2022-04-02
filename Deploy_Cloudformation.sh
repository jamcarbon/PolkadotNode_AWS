sudo apt install awscli

aws configure

aws cloudformation describe-stacks

aws cloudformation validate-template --template-body file://CreatePolkaNodeCloudStack.yml

aws ec2 describe-key-pairs

ls -l

chmod 400 PolkaNodeKey.pem

aws cloudformation create-stack --stack-name PolkaNodeCS --template-body file://template1.yml --parameters ParameterKey=PolkaNodeKey,ParameterValue=PolkaNodeKey

aws cloudformation describe-stacks

aws cloudformation describe-stack-events --stack-name PolkaNodeCS






# Check the just created stacks to check the newely created instance ID

aws cloudformation describe-stacks

# grab the instance id an connect to it, I will use terminus to connect to it






# Connect to EC2


ssh -o file://PolkaNodeKey1.pem ec2-user@PolkadotFullNodeEC2.PublicIp


