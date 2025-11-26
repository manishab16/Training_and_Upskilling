Associate CloudWatch Policy to our EKS Worker Nodes Role
- Go to Services -> EC2 -> Worker Node EC2 Instance -> IAM Role -> Click on that role
# Policy to be associated
Associate Policy: CloudWatchAgentServerPolicy

Deploy CloudWatch Agent and Fluentd as DaemonSets-
curl -s https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/quickstart/cwagent-fluentd-quickstart.yaml | sed "s/{{cluster_name}}/eksdemo2/;s/{{region_name}}/eu-west-1/" | kubectl apply -f -

![App Screenshot](images/image2.png)

kubectl -n amazon-cloudwatch get daemonsets
![App Screenshot](images/image3.png)


Deploy Sample Nginx Application
kubectl apply -f kube-manifests
![App Screenshot](images/image4.png)


Access CloudWatch Dashboard
Access CloudWatch Container Insigths Dashboard
![App Screenshot](images/image5.png)


![App Screenshot](images/image6.png)



CloudWatch Log Insights
![App Screenshot](images/image7.png)


![App Screenshot](images/image8.png)



Create Graph for Avg Node CPU Utlization
DashBoard Name: EKS-Performance
Widget Type: Bar
Log Group: /aws/containerinsights/eksdemo1/performance
![App Screenshot](images/image9.png)

- STATS avg(node_cpu_utilization) as avg_node_cpu_utilization by NodeName
| SORT avg_node_cpu_utilization DESC 

![App Screenshot](images/image10.png)


- Container Restarts
DashBoard Name: EKS-Performance
Widget Type: Table
Log Group: /aws/containerinsights/eksdemo1/performance
STATS avg(number_of_container_restarts) as avg_number_of_container_restarts by PodName
| SORT avg_number_of_container_restarts DESC

![App Screenshot](images/image11.png)


- Container Restarts
DashBoard Name: EKS-Performance
Widget Type: Table
Log Group: /aws/containerinsights/eksdemo1/performance
STATS avg(number_of_container_restarts) as avg_number_of_container_restarts by PodName
| SORT avg_number_of_container_restarts DESC
![App Screenshot](images/image12.png)

Container Insights - CloudWatch Alarms
- Create Alarms - Node CPU Usage
    - Specify metric and conditions
    - Select Metric: Container Insights -> ClusterName -> node_cpu_utilization
    - Metric Name: eksdemo1_node_cpu_utilization
    -   Threshold Value: 4
    - Important Note: Anything above 4% of CPU it will send a notification email, ideally it should 80% or 90% CPU but we are giving 4% CPU just for load simulation testing

![App Screenshot](images/image13.png)


![App Screenshot](images/image14.png)


![App Screenshot](images/image15.png)


![App Screenshot](images/image16.png)


![App Screenshot](images/image17.png)



![App Screenshot](images/image18.png)



![App Screenshot](images/image19.png)


