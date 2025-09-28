FROM public.ecr.aws/s0b5c6b7/builder/rpm:9.6-20250929

ENV BUILD_DIR="/root/rpmbuild"
COPY . ${BUILD_DIR}/

WORKDIR ${BUILD_DIR}

CMD ["/bin/bash"]
