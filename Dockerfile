FROM ubuntu:18.04
RUN apt-get update  

ENV TZ=America/Los_Angeles
RUN echo $TZ > /etc/timezone
RUN apt-get install -y tzdata
RUN dpkg-reconfigure  -f noninteractive tzdata

#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone 
ENV CATALINA_HOME /opt

# Install packages  
RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer;

RUN apt-get update && \
	apt-get install -y ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Workdir 
WORKDIR /opt 

# Install Tomcat
ENV PATH $JAVA_HOME/bin:$PATH
##ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
RUN mkdir -p plugins
ADD target/cityapplication-1.0.0.jar /opt/
#ADD blankFile  plugins/*.jar /opt/plugins/
#ADD blankFile props/* /opt/ 
#ADD start.sh /opt/

EXPOSE 8083

#CMD ["/opt/start.sh", "run"]

