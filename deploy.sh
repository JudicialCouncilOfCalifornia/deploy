set -e

sudo yum update -y
sudo yum install docker python python-setuptools
pip install awscli
aws configure
sudo $(aws ecr get-login --no-include-email)
sudo docker run -d -p 80:80  617580300246.dkr.ecr.us-west-2.amazonaws.com/docassemble:latest
