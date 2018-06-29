eval $(aws ecr get-login --no-include-email --region us-west-2)
docker run -e S3ENABLE=true -e S3BUCKET=$TF_VAR_NAME -e S3ACCESSKEY=$AWS_ACCESS_KEY_ID -e S3SECRETACCESSKEY=AWS_SECRET_ACCESS_KEY -e S3REGION=us-west-2 -d -p 80:80 617580300246.dkr.ecr.us-west-2.amazonaws.com/docassemble-server:master
