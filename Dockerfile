
FROM rancher/kubectl:v.1.20.2

ADD https://raw.githubusercontent.com/disaster37/che-scripts/master/alpine.sh /tmp/alpine.sh
RUN sh /tmp/alpine.sh