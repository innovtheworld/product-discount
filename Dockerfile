FROM openjdk:8
EXPOSE 8282
ADD target/product-discount.jar product-discount.jar
ENTRYPOINT ["java","-jar","/product-discount.jar"]