FROM maven:3.5-jdk-8 as BUILD
COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp

#run tests before you build the war
# RUN mvn -f /usr/src/myapp/pom.xml package

From tomcat:7.0
COPY --from=BUILD /usr/src/myapp/src/project-ucll.war /usr/local/tomcat/webapps/project-ucll.war
EXPOSE 8080
