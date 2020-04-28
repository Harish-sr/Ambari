FROM centos:6

RUN yum install -y openssh-server wget
RUN yum install openssh-clients -y
RUN mkdir /root/.ssh
RUN touch /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh
RUN chmod 400 /root/.ssh/authorized_keys
ADD id_rsa /root/.ssh/
ADD id_rsa.pub /root/.ssh/
RUN echo "hadoop" | passwd --stdin root
RUN chkconfig sshd on

ADD ambari.repo /etc/yum.repos.d/
#ADD hdp.repo /etc/yum.repos.d/

#config files
ADD hosts /
ADD limits.conf /

## INSTALL JAVA
#RUN wget 192.168.33.10:8033/jdk-8u101-linux-x64.rpm -O /jdk-8u101-linux-x64.rpm
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
RUN chmod 755 jdk-8u131-linux-x64.rpm
RUN rpm -ivh jdk-8u131-linux-x64.rpm
RUN whereis java
#RUN yum install jdk-8u131-linux-x64.rpm -y
ENV JAVA_HOME=/usr/bin/java


RUN yum install ambari-agent -y
RUN yum install ambari-server -y
#RUN ambari-server setup -s -j /usr/bin/java
RUN ambari-server setup -s 
ADD ./start /
#CMD ["/start"]
