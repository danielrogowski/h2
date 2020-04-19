# Base Java image
FROM openjdk:8-jre-slim

# Maintainer
MAINTAINER Daniel Rogowski <https://github.com/danielrogowski>

# Ports to expose
# web server
EXPOSE 8082
# tcp server
EXPOSE 9092

# Volume for the h2 binary and the script
VOLUME /var/lib/h2
# Volume containing the H2 data will be provided by a volume mount when running the container
VOLUME /var/lib/h2/databases

# H2 version
ENV H2_VERSION "1.4.200"

# Download
ADD "https://repo1.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar" /var/lib/h2/h2.jar

# Startup script
COPY h2.sh /var/lib/h2/.

# Rights
RUN chmod u+x /var/lib/h2/h2.sh

# Java options
ENV JAVA_OPTIONS ""

# Additional H2 options
ENV H2_OPTIONS ""

# Entry point
ENTRYPOINT ["/var/lib/h2/h2.sh"]
