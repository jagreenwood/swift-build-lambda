FROM swift:5.7-amazonlinux2

RUN echo "PLATFORM = ${{ inputs.architecture }}"
RUN yum -y install zip

COPY build-package.sh /build-package.sh

ENTRYPOINT [ "/build-package.sh" ]