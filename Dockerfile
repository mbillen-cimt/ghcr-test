FROM tomcat:10.1-jdk17-temurin-focal@sha256:486ca281bb12bd43aa684d7ea407c3578cbe19d3cc84350f2bf9dba33bdda39b

LABEL org.opencontainers.image.source=https://github.com/mbillen-cimt/ghcr-test

WORKDIR $CATALINA_HOME

RUN set -x \
 && rm -rf webapps \
 && mv webapps.dist webapps \
 && sed -i 's/<\/tomcat-users>/<user username="admin" password="admin" roles="manager-gui" \/>\n<\/tomcat-users>/' conf/tomcat-users.xml \
 && sed -i '/<Valve/,/\/>/d' webapps/manager/META-INF/context.xml

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
