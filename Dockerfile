FROM ubuntu:18.04
MAINTAINER Andrey Mendelson "amenos@gmail.com"
RUN apt-get update
RUN apt-get install -qy git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

RUN apt-get install -qy tomcat8
RUN apt-get install -qy maven
RUN apt-get install -qy default-jdk

WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package -f /boxfuse-sample-java-war-hello/pom.xml
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat8/webapps

EXPOSE 8080
CMD ["catalina.sh", "run"]
