#
# Btmon ecm data collection and publishing service
#
# http://github.com/tenstartups/btmon-docker
#

FROM alpine:latest

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  TERM=xterm-color

# Install packages.
RUN \
  apk apk add --no-cache python3 mysql-client py3-pip sqlite

# Install mysql python connector
RUN pip install --allow-external mysql-connector-python

# Add files to the container.
COPY entrypoint.sh /docker-entrypoint
COPY btmon.py /usr/local/bin/btmon

# Define the command script.
CMD ["/docker-entrypoint"]
