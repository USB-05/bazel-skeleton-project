

OVH bazel-remote-cache user

User: user-fGvuTV8tfCxQ
Access Key: 7a76000f46bb4c49ad7ba1f1710241f5
Secret Key: 50e6247c60644bc298011580800174b5
Region: us-west-or


docker run -u 1000:1000 \
-v /path/to/cache/dir:/data \
-v $HOME/.aws:/aws-config \
-p 9090:8080 -p 9092:9092 buchgr/bazel-remote-cache \
--s3.auth_method=aws_credentials_file --s3.aws_profile=supercool \
--s3.aws_shared_credentials_file=/aws-config/credentials \
--s3.bucket=my-bucket --s3.endpoint=s3.us-east-1.amazonaws.com \
--max_size 5




#######################
NOTES From Diptiman
#######################

s3_auth_method="aws_credentials_file"
s3_aws_profile="default"
s3_aws_shared_credentials_file="/aws-config/credentials"
s3_bucket="bazel-cache"
s3_endpoint="s3.us-west-or.perf.cloud.ovh.us"

tls_ca_file="/tmp/ca.crt"
tls_cert_file="/tmp/client.crt"
tls_key_file="/tmp/client.pem"

echo $tls_certificate | base64 -d > /tmp/ca.crt
echo $tls_client_key | base64 -d > /tmp/client.pem
echo $tls_client_certificate | base64 -d > /tmp/client.crt

docker run -u 1000:1000 \

   -v /home/ubuntu/bazel-cache:/data \
   -v $HOME/.aws:/aws-config \
   -v /home/ubuntu/certs:/certs \
   -v /home/ubuntu/htppass:/httpass\

   -p 9090:8080 -p 9092:9092 buchgr/bazel-remote-cache \

   --s3.auth_method=${s3_auth_method} \
   --s3.aws_profile=${s3_aws_profile} \
   --s3.aws_shared_credentials_file=${s3_aws_shared_credentials_file} \
   --s3.bucket=${s3_bucket} --s3.endpoint=${s3_endpoint} \

   --tls_ca_file=/certs/ca_cert \
   --tls_cert_file=/certs/server_cert \
   --tls_key_file=/certs/server_key --max_size 5



docker run -v ./data:/data \
	-v ./certs/tls_ca_file:/etc/bazel-remote/ca_cert \
	-v ./certs/tls_cert_file:/etc/bazel-remote/server_cert \
	-v ./certs/tls_key_file:/etc/bazel-remote/server_key \
	-p 9090:8080 -p 9092:9092 buchgr/bazel-remote-cache \
	--tls_ca_file=/etc/bazel-remote/ca_cert \
	--tls_cert_file=/etc/bazel-remote/server_cert \
	--tls_key_file=/etc/bazel-remote/server_key \
	--max_size 1


docker run -v ./data:/data \
    -v ./s3-config:/aws-config \
	-p 9090:8080 -p 9092:9092 buchgr/bazel-remote-cache \
	--max_size 1 \
    --s3.auth_method=aws_credentials_file \
    --s3.aws_profile=bazel-cache \
    --s3.aws_shared_credentials_file=/aws-config/credentials \
    --s3.bucket=remote-build-cache \
    --s3.endpoint=s3.us-west-or.perf.cloud.ovh.us