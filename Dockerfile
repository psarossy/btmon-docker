#
# Btmon ecm data collection and publishing service
#
# http://github.com/tenstartups/btmon-docker
#

FROM alpine:3.15

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  TERM=xterm-color

# Install packages.
RUN \
  apk add --no-cache python2 mysql-client py-pip sqlite py3-mysqlclient

# Add files to the container.
COPY entrypoint.sh /docker-entrypoint
COPY btmon.py /usr/local/bin/btmon

# Define the command script.
CMD ["/docker-entrypoint"]
