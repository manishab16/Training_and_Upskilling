EKS Storage 
Install Amazon EBS CSI Driver
1.on Add-ons → Get more add-ons
2.Search for Amazon EBS CSI driver (aws-ebs-csi-driver)
3.On the Permissions step, choose Create recommended role
    -Console will create an IAM role with the managed policy: AmazonEBSCSIDriverPolicy, and AmazonEKSClusterPolicy
    -Trust is automatically set to pods.eks.amazonaws.com
![App Screenshot](images/image1.png)


![App Screenshot](images/image2.png)


![App Screenshot](images/image3.png)


![App Screenshot](images/image4.png)


![App Screenshot](images/image5.png)


![App Screenshot](images/image6.png)


Verify installation
# List pods in kube-system
kubectl get pods -n kube-system
![App Screenshot](images/image7.png)

kubectl get ds -n kube-system
![App Screenshot](images/image8.png)


# Deployments
kubectl get deploy -n kube-system
![App Screenshot](images/image9.png)


Create Kubernetes Manifests for Storage Class, PVC and ConfigMap
- Create Storage Class manifest
# Create Storage Class & PVC
kubectl apply -f kube-manifests/

# List Storage Classes
kubectl get sc

# List PVC
kubectl get pvc 
![App Screenshot](images/image10.png)


Create Kubernetes Manifests for MySQL Deployment & ClusterIP Service
Create MySQL Database with all above manifests
# Create MySQL Database
kubectl apply -f kube-manifests/
# List Storage Classes
kubectl get sc

# List PVC
kubectl get pvc 

# List PV
kubectl get pv

# List pods
kubectl get pods 
![App Screenshot](images/image11.png)

![App Screenshot](images/image12.png)



![App Screenshot](images/image13.png)

Connect to MySQL Database
![App Screenshot](images/image14.png)

# Connect to MYSQL Database
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -pdbpassword11
![App Screenshot](images/image15.png)


![App Screenshot](images/image16.png)
