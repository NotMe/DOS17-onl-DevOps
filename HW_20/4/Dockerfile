FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

RUN apt update \
&& apt install -y \
git

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz \
&& tar xzvf apache-maven-3.9.5-bin.tar.gz \
&& export PATH="/app/apache-maven-3.9.5/bin/:$PATH" \
&& git clone https://github.com/LorenzoBettini/docker-compose-java-example.git \
&& cd docker-compose-java-example/com.examples.hellodockernet \
&& mvn package

CMD ["java", "-jar", "/app/docker-compose-java-example/com.examples.hellodockernet/target/hellodockernet-0.0.1-SNAPSHOT-jar-with-dependencies.jar", "mongodb"]
