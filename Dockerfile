FROM anapsix/alpine-java

ADD http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz /opt/dynamodb/install/

WORKDIR /opt/dynamodb

RUN tar -xzf install/*.tar.gz && \
    rm -rf install

ENTRYPOINT [ "java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb" ]

CMD [ "-inMemory" ]

EXPOSE 8000