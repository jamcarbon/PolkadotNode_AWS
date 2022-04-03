#!/bin/bash

aws cloudformation describe-stacks ;

aws cloudformation validate-template --template-body file://CreatePolkaNodeCloudStack.yml ;

aws ec2 create-key-pair --key-name PNK --query 'KeyMaterial' --output text > PNK.pem ;

aws ec2 describe-key-pairs ;

ls -l ;

chmod 400 PNK.pem ;

aws cloudformation create-stack --stack-name PolkaNodeCS --template-body file://CreatePolkaNodeCloudStack.yml --parameters ParameterKey=PolkaNodeKey,ParameterValue=PolkaNodeKey ;

aws cloudformation describe-stacks ;

aws cloudformation describe-stack-events --stack-name PolkaNodeCS ;




# Check the just created stacks to check the newely created instance IP

aws cloudformation describe-stacks ;

# grab the instance ip an connect to it, I will use termius to connect to it






