#Build the application first using Maven
From maven:3.8-openjdk-8 as build
WORKDIR /app
COPY . .
RUN mvn install

#Inject the JAR file into a new container to keep the file small
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/product-discount-*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["sh","-c"]
CMD ["java -jar app.jar"]