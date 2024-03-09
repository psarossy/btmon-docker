#
# Btmon ecm data collection and publishing service
#
# http://github.com/tenstartups/btmon-docker
#

FROM alpine:3.15

# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

# Set environment variables.
ENV \
  TERM=xterm-color

RUN apk add --no-cache python2 sqlite && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools influxdb && \
    rm -r /root/.cache


# Add files to the container.
COPY entrypoint.sh /docker-entrypoint
COPY btmon.py /usr/local/bin/btmon

# Define the command script.
CMD ["/docker-entrypoint"]
