# HDP-multi-node-docker
provisioning of a multi-node hadoop cluster using docker

# Steps to create\build the ambari master and agent docker files needed to build cluster
1. login to the master using root permission or "sudo su" to root
2. Download and install git "yum install git" in the master node
3. download the repository https://github.com/Harish-sr/Ambari using git clone https://github.com/Harish-sr/Ambari.git command
2. Navigate to the Ambari/HDP-multi-node-DOcker directory
3. update hosts file to reflect the hosts that are used to setup. In the following locations HDP-multi-node-Docker, ambari-agent-template and ambari-server-template. 
4. update in the hosts file in one loaction  "HDP-multi-node-Docker" using vi editor and copy the same using command "cp hosts ambari-agent-template/" and "cp hosts ambari-server-template/"
4. check for ambari repo file in ambari-agent-template and ambari-server-template
5. Generate the headless user keys id_rsa and id_rsa.pub  at /root/.ssh/id_rsa.pub using command "ssh-keygen"
6. copy the id_rsa and id_rsa.pub into the directory ambari-agent-template and directory ambari-server-template ["cp /root/.ssh/id_rsa.pub Ambari/ambari-agent-template" and "cp /root/.ssh/id_rsa.pub Ambari/ambari-server-template"]
7. install docker using the command "yum install docker" and start the  docker service. Using command "systemctl start docker". check the status using "systemctl status docker"
8. change the premissions of the script file to run using command "chmod 775 *.sh" under HDP-multi-node-Docker directory
8. run ```build_images.sh``` under the Ambari/HDP-multi-node-Docker
9. export and load agent image to all hosts in your cluster
10. provision cluster with ambari via http://"master-node-host":8080. 

### Ambari Console:

point to the local HDP binaries during the install by replacing the default IP addresses (for Centos 6) with:
* HDP-2.3:  		        http://192.168.33.10:8033/HDP/centos6/2.x/updates/2.3.2.0
* HDP-UTILS-1.1.0.20:  	    http://192.168.33.10:8033/HDP-UTILS-1.1.0.20/repos/centos6

