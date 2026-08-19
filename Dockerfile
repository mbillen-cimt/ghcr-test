FROM tomcat:11.0-jdk17-temurin@sha256:12f2e02c9e1e569b8d5a6fd5955b6085d490067c3bbfb5b0b9221c1c0ed8a149

LABEL org.opencontainers.image.source=https://github.com/mbillen-cimt/ghcr-test

WORKDIR $CATALINA_HOME

RUN set -x \
 && rm -rf webapps \
 && mv webapps.dist webapps \
 && sed -i 's/<\/tomcat-users>/<user username="admin" password="admin" roles="manager-gui" \/>\n<\/tomcat-users>/' conf/tomcat-users.xml \
 && sed -i '/<Valve/,/\/>/d' webapps/manager/META-INF/context.xml

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
