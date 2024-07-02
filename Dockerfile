FROM tomcat:9.0-jdk17-temurin-focal

WORKDIR $CATALINA_HOME

RUN set -x \
 && rm -rf webapps \
 && mv webapps.dist webapps

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]