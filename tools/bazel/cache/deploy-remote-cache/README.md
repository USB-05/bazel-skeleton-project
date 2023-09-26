This Document contains steps on how to setup the bazel remote server as proxy cache server in any cloud and do operations with buckets in any cloud.

Step 1:
    Create TLS secrets for the bazel cache to use in the Kubernetes cluster. You can get these certificates from SecOps team.
    Command: kubectl create secret tls <Secret-Name> -n <Namespace> --from-file=./tls_ca_cert --from-file=./tls_cert.cert --from-file=./tls_key.key

Step 2:
    Gather the bucket details (URL, Bucket Name, Access Key and Secret Key). These information will be part of the configMap or Secret objects in the Kubernetes Cluster.

Step 3:
    Put Taints and Labels on nodepool/node running in Kubernetes Cluster. This is required so that no other pod can get provision on these nodes apart from the bazel-remote cache pods.
    Command: kubectl label nodepool bazel-cache purpose=bazel-cache -> To put Labels
             kubectl taint nodepool bazel-cache purpose=bazel-cache:PreferNoSchedule -> To put Taints

Step 4:
    Apply the following yamls in the Kubernetes cluster
        - config.yaml -> Containing Bucket details mentioned in Step 2
        - service.yaml -> Contains Ports which are exposed for jobs to connect
        - statefulset.yaml -> bazel-remote server itself

Step 5:
    Once all the yamls are applied, port forward the port in your local machine and check the status by hitting URL "http://localhost:8080/status". You should get a JSON object in the browser window.

For more details, Visit Link:
    Link: https://github.com/buchgr/bazel-remote


###### TO RUN LOCALLY ##########
docker run -v ./data:/data \
    -v ./s3-config:/aws-config \
	-p 9090:8080 -p 9092:9092 buchgr/bazel-remote-cache \
	--max_size 1 \
    --s3.auth_method=aws_credentials_file \
    --s3.aws_profile=bazel-cache \
    --s3.aws_shared_credentials_file=/aws-config/credentials \
    --s3.bucket=remote-build-cache \
    --s3.endpoint=s3.us-west-or.perf.cloud.ovh.us

###### TO DEPLOY INGRESS CONTROLLER ##########
kubectl create ns ingress-nginx-130
kubectl apply -f ingress-130.yaml -n ingress-nginx-130
kubectl delete validatingwebhookconfigurations ingress-nginx-admission
kubectl create secret tls tls-certs --key tls_key.key --cert tls_fullchain.cert --namespace ingress-nginx-130


###### TO DEPLOY CERTS ##########
kubectl create secret tls bazel-cache-certs -n bazel-cache-harness --from-file=./tls_ca_cert --from-file=./tls_cert.cert --from-file=./tls_key.key
kubectl create secret tls tls-certs -n bazel-cache-harness --key ./tls_key.key --cert ./tls_fullchain.cert
kubectl create secret generic bazel-tls-configs -n bazel-cache-harness --from-file=./tls_fullchain.cert --from-file=./tls_key.key --from-file=./tls_ca.cert

###### TO LABEL< TAINT NODES ##########
kubectl label nodepool bazel-cache purpose=bazel-cache
kubectl taint nodepool bazel-cache purpose=bazel-cache:PreferNoSchedule
kubectl taint nodepool bazel-cache purpose=bazel-cache:PreferNoSchedule

kubectl label nodepool bazel-cache-memory purpose=bazel-cache-memory
kubectl taint nodepool bazel-cache-memory purpose=bazel-cache-memory:PreferNoSchedule
