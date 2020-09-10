docker build -t java-test -f DockerfileJdk14 .

docker run --rm --name java-test java-test

docker run --rm -e JAVA_OPTS="-Xms256m -Xmx384m" --name java-test java-test



