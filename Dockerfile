# Pull tomcat latest image from dockerhub 
From tomcat:latest

# Maintainer
COPY hello-worls/target/webapp.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]

# copy war file on to container 
#COPY ./webapp.war /usr/local/tomcat/webapps
