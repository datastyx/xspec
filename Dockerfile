FROM openjdk:8-jre-alpine

ARG saxon_ver=9.9.1-5

RUN wget \
  http://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/${saxon_ver}/Saxon-HE-${saxon_ver}.jar \
-O /usr/local/share/saxon.jar

WORKDIR /usr/local/share/xspec

RUN apk add git \
    && git clone https://github.com/xspec/xspec.git . \
    && git checkout tags/v1.4.0 -b v1.4.0

ENV SAXON_CP=/usr/local/share/saxon.jar

CMD ["bin/xspec.sh"]



