FROM swift:5.7-amazonlinux2

ARG PLATFORM
RUN echo "PLATFORM = $PLATFORM"
RUN yum -y install zip

COPY build-package.sh /build-package.sh

ENTRYPOINT [ "/build-package.sh" ]