FROM swift:5.8-amazonlinux2

RUN yum -y install zip

COPY build-package.sh /build-package.sh

ENTRYPOINT [ "/build-package.sh" ]