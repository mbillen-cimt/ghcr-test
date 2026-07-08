FROM tomcat:11.0-jdk17-temurin@sha256:8a6f2475f329f95f896f76d2b34a3ab187d3e0ec3d37d712889bba0c07cd84d3

LABEL org.opencontainers.image.source=https://github.com/mbillen-cimt/ghcr-test

WORKDIR $CATALINA_HOME

RUN set -x \
 && rm -rf webapps \
 && mv webapps.dist webapps \
 && sed -i 's/<\/tomcat-users>/<user username="admin" password="admin" roles="manager-gui" \/>\n<\/tomcat-users>/' conf/tomcat-users.xml \
 && sed -i '/<Valve/,/\/>/d' webapps/manager/META-INF/context.xml

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
