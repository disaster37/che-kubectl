
FROM bitnami/kubectl:1.20

USER root

ADD https://raw.githubusercontent.com/disaster37/che-scripts/master/debian.sh /tmp/debian.sh
RUN sh /tmp/debian.sh