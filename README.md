# dockerfiles
This is going to be the base image for AWS CLI by Pavan Kumar Aleti

Build the file:
---------------

$ docker build -f awscli.Dockerfile . --build-arg VERSION=1.16.170 -t aletipavan/awscli:0.0.2 --no-cache

#Run the Container: Some Examples

Shows Version:
-------------
$  docker run aletipavan/awscli:0.0.2

aws-cli/1.16.170 Python/2.7.16 Linux/4.9.125-linuxkit botocore/1.12.160

Shows caller-identity
---------------------
$ docker run -i -t --rm -v ~/.aws/credentials:/root/.aws/config:ro aletipavan/awscli:0.0.2 sts get-caller-identity


Executing AWS CLI Commands:
--------------------------

$ docker run -i -t --rm -v ~/.aws/credentials:/root/.aws/credentials:ro -v  ~/.aws/config:/root/.aws/config:ro aletipavan/awscli:0.0.2 ec2 describe-instances

List IAM Users:

$ docker run -i -t --rm -v ~/.aws/credentials:/root/.aws/credentials:ro -v  ~/.aws/config:/root/.aws/config:ro aletipavan/awscli:0.0.2 iam list-users


#Push to DockerHub (you can't push to my dockerhub)

Note: 
----
Rename the image from aletipavan to yourname and push it to your dockerhub

$ docker login

$ docker build -f awscli.Dockerfile . --build-arg VERSION=1.16.170 -t al/awscli:0.0.2 --no-cache

$ docker tag aletipavan/awscli:0.0.2 aletipavan/awscli:latest

$ docker push aletipavan/awscli:0.0.2

$ docker push aletipavan/awscli:latest 