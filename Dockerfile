FROM tomcat:11.0-jdk17-temurin@sha256:df98b8787205021a45c28ca9c73a8aaabb954ab27bf89c701c9af1c6f7fd6344

LABEL org.opencontainers.image.source=https://github.com/mbillen-cimt/ghcr-test

WORKDIR $CATALINA_HOME

RUN set -x \
 && rm -rf webapps \
 && mv webapps.dist webapps \
 && sed -i 's/<\/tomcat-users>/<user username="admin" password="admin" roles="manager-gui" \/>\n<\/tomcat-users>/' conf/tomcat-users.xml \
 && sed -i '/<Valve/,/\/>/d' webapps/manager/META-INF/context.xml

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
