FROM centos
RUN yum install net-tools -y
RUN yum install wget -y
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install java -y
RUN yum install jenkins -y
RUN yum install openssh-clients -y
RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN yum install git -y
RUN yum install sshpass -y
RUN yum install sudo -y
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN yum install python3 -y
COPY mailer.py /
ADD myscript.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
 
EXPOSE 8080
