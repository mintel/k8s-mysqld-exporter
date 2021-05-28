FROM alpine:3.13

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Nick Badger <nbadger@mintel.com>" \
      org.opencontainers.image.title="k8s-mysqld-exporter" \
      org.opencontainers.image.description="Minimal image with mysqld-exporter installed." \
      org.opencontainers.url="https://github.com/mintel/k8s-mysqld-exporter" \
      org.opencontainers.source="https://github.com/mintel/k8s-mysqld-exporter.git" \
      org.opencontainers.image.version="0.13.0+mintel.0.3.0" \
      org.opencontainers.image.vendor="Mintel Group Ltd." \
      org.opencontainers.image.licences="MIT" \
      org.opencontainers.authors="Nick Badger <nbadger@mintel.com>" \
      org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.revision="$VCS_REF"

# Temp copy fow since it fixes a bug in dsn handling.
# https://github.com/prometheus/mysqld_exporter/pull/485
# COPY --from=prom/mysqld-exporter:v0.12.1 /bin/mysqld_exporter /bin
COPY --from=mintel/mysqld-exporter:0.13.0_mintel-fix-dsn /bin/mysqld_exporter /bin

RUN adduser -D -s /bin/sh -u 1000 mintel --home /home/mintel

COPY docker-entrypoint.sh /

USER 1000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/mysqld_exporter"]
