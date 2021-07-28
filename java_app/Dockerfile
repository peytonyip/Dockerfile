FROM maven:3.8.1-jdk-8-openj9 as Builder

WORKDIR /app
COPY ./springboot-hello ./springboot-hello

RUN cd /app/springboot-hello && \
    mvn clean install -Dmaven.test.skip=true

#FROM openjdk:8
FROM openjdk:8-jdk-alpine


WORKDIR /application

COPY env.sh /application/
COPY run.sh /application/

COPY --from=builder /app/springboot-hello/target/springboot-hello-1.0.jar /application/app.jar

RUN apk update && \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /application/logs/java/ && \
    chmod +x /application/run.sh



#ENTRYPOINT . /application/env/env.sh && nohup java  -Dloader.path=/application/BOOT-INF/lib/ -Xmx2048m -Xms2048m -verbose:gc -Xloggc:/app/logs/quality-check-logs/gc.log -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+PrintGCDetails -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=128m -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70 -XX:+CMSParallelRemarkEnabled -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/app/logs/quality-check-logs -jar /application/app.jar

#ENTRYPOINT ["java","${JAVA_OPTS}","-jar","/application/app.jar"]

##
ENTRYPOINT ["/application/run.sh"]