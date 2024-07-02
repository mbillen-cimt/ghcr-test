FROM tomcat:9.0-jdk17-temurin-focal

LABEL org.opencontainers.image.source=https://github.com/mbillen-cimt/ghcr-test

WORKDIR $CATALINA_HOME

RUN set -x \
 && rm -rf webapps \
 && mv webapps.dist webapps \
 && sed -i 's/<\/tomcat-users>/<user username="admin" password="admin" roles="manager-gui" \/><\/tomcat-users>/' conf/tomcat-users.xml

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
