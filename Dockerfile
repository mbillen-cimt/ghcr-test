FROM tomcat:11.0-jdk17-temurin@sha256:a522d9bd3ed78f1f0bb5909c277c60c5f94a0513ae8fbae8a0a5a6be64528365

LABEL org.opencontainers.image.source=https://github.com/mbillen-cimt/ghcr-test

WORKDIR $CATALINA_HOME

RUN set -x \
 && rm -rf webapps \
 && mv webapps.dist webapps \
 && sed -i 's/<\/tomcat-users>/<user username="admin" password="admin" roles="manager-gui" \/>\n<\/tomcat-users>/' conf/tomcat-users.xml \
 && sed -i '/<Valve/,/\/>/d' webapps/manager/META-INF/context.xml

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
