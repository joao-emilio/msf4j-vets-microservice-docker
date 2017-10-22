FROM java:8-jre
MAINTAINER joaoemilio@devthinkers.com
ADD target/vets-2.1.0.jar /opt/
WORKDIR /opt
EXPOSE 8080
ENTRYPOINT java -jar /opt/vets-2.1.0.jar
