
FROM alpine:3.14

ENV KUBECTL_VERSION="v1.18.6"


ADD https://raw.githubusercontent.com/disaster37/che-scripts/master/alpine.sh /tmp/alpine.sh
RUN sh /tmp/alpine.sh

# Install kubectl
RUN \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/bin/kubectl &&\
    chmod +x /usr/bin/kubectl

# Install chectl
RUN apk add --update nodejs
USER theia
RUN bash -c "bash <(curl -sL  https://www.eclipse.org/che/chectl/)"

# Clean
USER root
RUN \
    rm -rf /home/theia/.cache &&\
    rm -rf /var/cache/apk/*