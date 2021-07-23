
FROM alpine:3.14

ENV KUBECTL_VERSION="v1.18.6" \
    OC_VERSION="4.3.3" \
    HELM_VERSION="v3.6.3"


ADD https://raw.githubusercontent.com/disaster37/che-scripts/master/alpine.sh /tmp/alpine.sh
RUN sh /tmp/alpine.sh

# Install some tools
RUN \
    echo "Install kubectl" &&\
    curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/bin/kubectl &&\
    chmod +x /usr/bin/kubectl &&\
    echo "Install oc" &&\
    curl -o- -L https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OC_VERSION}/openshift-client-linux-${OC_VERSION}.tar.gz | tar xvz -C /usr/local/bin oc &&\
    chmod +x /usr/local/bin/oc &&\
    echo "Install helm" &&\
    curl -o- -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xvz -C /usr/local/bin helm &&\
    chmod +x /usr/local/bin/helm
    

# Install chectl
RUN apk add --update nodejs
USER theia
RUN bash -c "bash <(curl -sL  https://www.eclipse.org/che/chectl/)"

# Clean
USER root
RUN \
    rm -rf /home/theia/.cache &&\
    rm -rf /var/cache/apk/*
