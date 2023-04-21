FROM swift:5.7-amazonlinux2

ARG INPUT_ARCHITECTURE
RUN echo "INPUT_ARCHITECTURE = $INPUT_ARCHITECTURE"
RUN yum -y install zip

COPY build-package.sh /build-package.sh

ENTRYPOINT [ "/build-package.sh" ]