FROm openjdk:8 AS BUILD_IMAGE
RUN apt update && apt install maven -y
RUN git clone -b master https://github.com/2kaushik7/JavaWebAppForJenkins.git
RUN cd JavaWebAppForJenkins && mvn install

FROM tomcat:8-jre11

RUN rm -rf /usr/loca/tomcat/webapps/*

COPY --from=BUILD_IMAGE JavaWebAppForJenkins/target/JavaWebAppForJenkins.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD["catalina.sh","run"] 

