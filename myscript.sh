#!/bin/bash

ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< y
sshpass -p "redhat" ssh-copy-id -o StrictHostKeyChecking=no root@192.168.43.77
java -jar /usr/lib/jenkins/jenkins.war

