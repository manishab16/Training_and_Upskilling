Amazon EKS Pod Identity Agent-
- Amazon EKS Pod Identity – High-Level Flow
    - Amazon EKS Pod Identity enables pods in your cluster to securely assume IAM roles without managing static credentials or using IRSA annotations. The high-level flow is shown below:
![App Screenshot](images/image1.png)

Install EKS Pod Identity Agent
![App Screenshot](images/image2.png)


![App Screenshot](images/image3.png)



![App Screenshot](images/image4.png)


This installs a DaemonSet (eks-pod-identity-agent) that enables Pod Identity associations.

# List k8s PIA Resources
kubectl get daemonset -n kube-system
![App Screenshot](images/image6.png)

# List k8s Pods
kubectl get pods -n kube-system
![App Screenshot](images/image7.png)

Deploy AWS CLI Pod (without Pod Identity Association)
Create Service Account
- 01_k8s_service_account.yaml

Create a simple Kubernetes Pod with AWS CLI image:
- 02_k8s_aws_cli_pod.yaml

Deploy CLI Pod
kubectl apply -f kube-manifests/
kubectl get pods
![App Screenshot](images/image8.png)


Create IAM Role for Pod Identity
![App Screenshot](images/image9.png)

![App Screenshot](images/image10.png)


![App Screenshot](images/image11.png)

![App Screenshot](images/image12.png)


![App Screenshot](images/image13.png)


![App Screenshot](images/image14.png)



Test Again
- Restart Pod
# Delete Pod
kubectl delete pod aws-cli -n default
# Create Pod
kubectl apply -f kube-manifests/02_k8s_aws_cli_pod.yaml
![App Screenshot](images/image15.png)

# List Pods
kubectl get pods
![App Screenshot](images/image16.png)

Exec into the Pod:
# List S3 buckets
kubectl exec -it aws-cli -- aws s3 ls

Clean Up
kubectl delete -f kube-manifests/
![App Screenshot](images/image17.png)

- Without Pod Identity Association: Pod has no IAM permissions → AWS API calls fail
- With Pod Identity Association: Pod Identity Agent maps Pod’s Service Account → IAM Role → AWS Permissions → API calls succeed
