#FROM openjdk:17
#ARG JAR_FILE=connectdog-0.0.1-SNAPSHOT.jar
#COPY $JAR_FILE app.jar
#ENTRYPOINT ["java", "-jar", "/app.jar"]

# Java 17 기반 이미지를 사용 (Spring Boot에 맞는 JDK 버전 사용)
FROM openjdk:17-jdk-slim

ARG JAR_FILE=test-0.0.1-SNAPSHOT.jar
# 변수 설정
#ARG JAR_FILE=./build/libs/*.jar

# 애플리케이션 JAR 파일 복사
#COPY target/my-application.jar /app/my-application.jar
#COPY build/libs/dangdang-salon-service-*-SNAPSHOT.jar app.jar

# 빌드한 JAR 파일 원하는 경로에 복사
COPY ${JAR_FILE} app.jar

# 애플리케이션 실행 포트
EXPOSE 8080

# Spring Boot 애플리케이션 실행
ENTRYPOINT ENTRYPOINT ["java", "-jar", "/app.jar"]