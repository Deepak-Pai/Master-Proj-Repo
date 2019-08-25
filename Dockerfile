#Docker File

FROM devopsedu/webapp:latest

MAINTAINER Deepak Pai <Deepak.7pai7@gmail.com>

#Upgrade container
RUN apt-get update -y

#Install git
RUN apt-get install -y git

#Delete the deploy folder
RUN rm -rf /var/www/html/*

#Delete if any existing folder
RUN rm -rf /home/ec2-user/Project-PHP-Code


#WORKDIR /home/ec2-user/

#Clone from git hub
RUN git clone https://github.com/Deepak-Pai/projCert.git /home/ec2-user/Project-PHP-Code

WORKDIR /home/ec2-user/


#Copy php code to deploy path
#ADD /Project-PHP-Code /var/www/html/
RUN cp -R /home/ec2-user/Project-PHP-Code/website/* /var/www/html/

#expose port 80
EXPOSE 80


#Start apache2 service
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
