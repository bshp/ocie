# syntax=docker/dockerfile-upstream:master
    
# Ubuntu Version, e.g 22.04 unquoted
ARG OS_VERSION
    
# Optional: Change Timezone
ARG TZ=America/North_Dakota/Center
    
FROM ubuntu:$OS_VERSION
    
LABEL org.opencontainers.image.authors="jason.everling@gmail.com"
    
ARG OS_VERSION
ARG TZ
    
ENV OCIE_HOME=/etc/ocie
ENV OCIE_LIB=/usr/lib/ocie
    
# Set defaults
##############################
ENV APP_NAME="default"
ENV APP_PARAMS=""
ENV APP_TYPE=""
ENV APP_CACHE=/var/cache
ENV APP_DATA=/srv/${APP_NAME}
ENV APP_GROUP=""
ENV APP_OWNER=""
##############################
ENV APP_DEPLOY=0
ENV APP_UPDATE_AUTO=1
ENV APP_UPDATE_PATH=""
ENV APP_UPDATE_STRICT=0
##############################
ENV CA_ENABLED=0
ENV CA_PATH=""
ENV CA_FILTER="*_CA.crt"
ENV CA_UPDATE_AUTO=1
ENV CA_UPDATE_JVM=0
ENV CA_UPDATE_OS=0
##############################
ENV CERT_ENABLED=0
ENV CERT_NAME="server"
ENV CERT_PATH=/etc/ssl
ENV CERT_SUBJECT="localhost"
ENV CERT_SIZE=2048
ENV CERT_VALID=365
ENV CERT_TAG="updated.keys"
##############################
ENV DH_PARAM_SIZE=2048
##############################
ENV VADC_IP_ADDRESS="10.0.0.0/8 172.16.0.0/12 192.168.0.0/16"
ENV VADC_IP_HEADER="X-Forwarded-For"
    
# Add Ocie
COPY --chown=root:root --chmod=0755 ./src/ ./
    
RUN <<-"EOD" bash
    set -eu;
    echo "Ocie: Setting up environment";
    echo "OCIE_BIN=/usr/sbin" >> /etc/environment;
    echo "OCIE_HOME=${OCIE_HOME}" >> /etc/environment;
    echo "OCIE_LIB=${OCIE_LIB}" >> /etc/environment;
    echo "OS_BASE=${OS_VERSION}" >> /etc/environment;
    echo "OS_CODENAME=$(grep -o 'VERSION_CODENAME=.*' </etc/os-release | cut -f2 -d'=')" >> /etc/environment;
    echo "OS_IMAGE=ubuntu:${OS_VERSION}" >> /etc/environment;
    echo "OS_TIMEZONE=${TZ}" >> /etc/environment;
    echo "OS_VERSION=${OS_VERSION//.}" >> /etc/environment;
    echo ". /etc/environment" >> /etc/bash.bashrc;
    echo "Ocie: Setting up system";
    echo "Ocie: Creating container account, [ ocie ]";
    mkdir -p ${OCIE_HOME}/conf;
    useradd -d ${OCIE_HOME} -r -s /bin/bash ocie;
    install -d -m 0775 -o ocie -g ocie ${OCIE_HOME};
    # Install base packages, timezone
    ocie --pkg "-base -upgrade" --timezone "-set ${TZ}" --clean "-base" --print;
    echo "Ocie: System setup complete";
EOD
    
CMD ["/bin/bash"]
