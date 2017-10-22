FROM java:8-jre
MAINTAINER joaoemilio@devthinkers.com

WORKDIR /opt

# --------------------------------
# Copy scripts, packages & plugins
# --------------------------------
COPY target/vets-2.1.0.jar /opt/

# --------------------------------
# HTTP Monitoring and metrics specific config
# --------------------------------
ENV METRICS_REPORTING_DAS_DATAAGENTCONFIGPATH data-agent-conf.xml
ENV METRICS_REPORTING_DAS_RECEIVERURL "tcp://172.17.8.1:7612"
ENV HTTP_MONITORING_DAS_DATAAGENTCONFIGPATH data-agent-conf.xml
ENV HTTP_MONITORING_DAS_RECEIVERURL "tcp://172.17.8.1:7612"

# ----------------------
# Expose container ports
# ----------------------
EXPOSE 8080

ENTRYPOINT java -jar /opt/vets-2.1.0.jar