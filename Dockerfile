# Use Amazon Corretto 17 as base image
FROM amazoncorretto:17

# Set environment variables for Maven
ENV MAVEN_VERSION=3.9.9
ENV MAVEN_HOME=/opt/maven
ENV PATH="${MAVEN_HOME}/bin:${PATH}"

# Install Maven
RUN yum install -y curl tar && \
    curl -fsSL https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    | tar -xz -C /opt && \
    mv /opt/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} && \
    yum clean all

# Set working directory
WORKDIR /app

# Copy source code and build
COPY . /app

# Build the project using Maven
RUN mvn clean package

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "target/docker-jenkins-integration-sample.jar"]
