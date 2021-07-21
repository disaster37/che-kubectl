
FROM bitnami/kubectl:1.20

USER root

ADD https://raw.githubusercontent.com/disaster37/che-scripts/master/debian.sh /tmp/debian.sh
RUN sh /tmp/debian.sh

# Install nodejs and chectl
RUN \
    apt-get update &&\
    apt-get install -y --no-install-recommends nodejs &&\
    bash -c "bash <(curl -sL  https://www.eclipse.org/che/chectl/)" &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*