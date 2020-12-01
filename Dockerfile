FROM openjdk:16-jdk-alpine

ARG ALLURE_VERSION=2.13.7
ENV ALLURE_VERSION=$ALLURE_VERSION

LABEL multi.os="alpine" \
    multi.allure-version=$ALLURE_VERSION \
    multi.jdk=16

RUN apk update && \
    apk add --no-cache curl bash

RUN curl -o allure-${ALLURE_VERSION}.tgz -Ls https://github.com/allure-framework/allure2/releases/download/${ALLURE_VERSION}/allure-${ALLURE_VERSION}.tgz && \
    tar -zxvf allure-${ALLURE_VERSION}.tgz -C /opt/ && \
    rm -f allure-${ALLURE_VERSION}.tgz && \
    ln -s /opt/allure-${ALLURE_VERSION}/bin/allure /usr/bin/allure && \
    allure --version

CMD ["allure"]
