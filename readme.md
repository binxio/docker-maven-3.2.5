# docker-maven-3.2.5
Dockerized Maven 3.2.5 with Java 1.8.0_191

## Docker Build
Type: `make build`

## Reusing the Maven local repository
The local Maven repository can be reused across containers by creating a volume and mounting it in `/root/.m2`.

```bash
$ docker volume create --name maven-repo
$ docker run -it -v maven-repo:/root/.m2 maven mvn archetype:generate # will download artifacts
$ docker run -it -v maven-repo:/root/.m2 maven mvn archetype:generate # will reuse downloaded artifacts
```

Or you can just use your home `.m2` cache directory that you share e.g. with your Eclipse/IDEA:

```bash
$ docker run -it --rm \
    -v "$PWD":/usr/src/mymaven \
    -v "$HOME/.m2":/root/.m2 \
    -v "$PWD/target:/usr/src/mymaven/target" \
    -w /usr/src/mymaven \
    maven \
    mvn clean package
```

## Resources
- [Maven on Dockerhub](https://hub.docker.com/_/maven)
