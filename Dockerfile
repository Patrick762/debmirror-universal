FROM debian:bookworm

COPY ./scripts /app/scripts

# Ubuntu focal
ENV DEBMIRROR_DATA=/app/mirror/ubuntu
ENV ARCH=amd64,i386
ENV SECTION=main,restricted,universe,multiverse
ENV SERVER=archive.ubuntu.com
ENV RELEASE=jammy,jammy-updates,jammy-backports,jammy-security
ENV INPATH=/ubuntu
ENV PROTO=http

# Cron config
ENV CRON="0 */3 * * *"

WORKDIR /app/scripts
CMD [ "./entry.sh" ]
