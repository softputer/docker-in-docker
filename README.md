# docker-in-docker
This is a docker in docker repo based on centos7. There are two ways for you to accomplish this task.

##One way to Running This Container
One way to get you started in a easy way is use your host docker.
```
docker run -it -v /var/run/docker.sock:/var/run/docker.sock  softputer/dockerindocker:latest /bin/bash
```
You can also just use -v /usr/bin/docker:/usr/bin/docker to avoid installing docker in your image.

In the bash, you can use excute docker command to manipulate host docker resources. 

In this way, it's convenient for scheuler docker tasks among a cluster of hosts. But without resource limitations, it may be not a good way to accomplish this.

##Another Way
We can also do this by wrapping docker environment in docker container just as jpetazzo did. The wrapdocker script is from jpetazzo's repo [dind](https://github.com/jpetazzo/dind) .
```
$ docker run --privileged  -d -p 4444 -e PORT=4444 softputer/dockerindocker:centos7
$ docker ps
CONTAINER ID        IMAGE                                          COMMAND             CREATED             STATUS              PORTS                     NAMES
35843d8173b7        softputer/dockerindocker:centos7   "wrapdocker"        4 seconds ago       Up 1 seconds                                  naughty_jennings
$ docker exec -it 35843d8173b7 /bin/bash
```
After you get into the container, you can do anything docker can do in your isolated environment.

By the way, You can just get into it by excuting:
```
docker run --privileged -t -i softputer/dockerindocker:centos7
```



