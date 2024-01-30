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
