#/bin/bash
if [ ! "$(docker images | grep html | grep -i latest)"  ]; then
        docker build -t html:latest .
fi
if [  "$(docker ps -a | grep -i html | grep -i exited)" ]; then
                for i in $(docker ps -a | grep -i html | grep -i exited | awk '{print $1}'); do docker rm $i; done
fi
if [ !  "$(docker ps | awk '{print $2}' | grep -v ID | grep -i html)" ]; then
        docker run -i --rm -d -p 10101:80 html:latest
fi
