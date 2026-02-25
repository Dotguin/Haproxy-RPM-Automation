ARG BUILDER=public.ecr.aws/s0b5c6b7/builder/rpm:9.7-20260225

FROM ${BUILDER}

ARG OS="el9"

ENV BUILD_DIR="/root/rpmbuild"
ENV VERSION_DIST_FILE="VERSION-DIST"

COPY . ${BUILD_DIR}/
WORKDIR ${BUILD_DIR}

RUN set -eux; \
    DIST_COUNT=$(cat ${VERSION_DIST_FILE}); \
    DIST=${DIST_COUNT}.${OS}; \
    echo "$DIST" > ${VERSION_DIST_FILE}

CMD ["/bin/bash"]
