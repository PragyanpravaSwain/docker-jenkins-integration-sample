# Use Amazon Corretto 17 as base image
FROM amazoncorretto:17


# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "target/docker-jenkins-integration-sample.jar"]
