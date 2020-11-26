FROM maven:3.5-jdk-8 as Build
COPY scr /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml package

From tomcat:7.0
COPY --from=BUILD /usr/src/myapp/target/project.war /usr/local/tomcat/webapp/project.war
EXPOSE 8080
