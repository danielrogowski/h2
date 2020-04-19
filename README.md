This image runs a [H2 database](http://h2database.com/) in server mode.

### Quick Start

Clone the repo and switch to the folder:

```bash
git clone https://github.com/danielrogowski/h2.git h2-docker
cd h2-docker
```

To create an image from the Dockerfile:

```bash
docker build -t h2-server_1.4.200_image .
```

To create a volume on the host to be used by the container:

```bash
docker volume create h2-server_1.4.200
```

To run a container using the image:

```bash
docker run \
   --publish 8082:8082 \
   --publish 9092:9092 \
   --detach \
   --name h2-server_1.4.200 \
   --mount source=h2-server_1.4.200,target=/var/lib/h2/databases \
   h2-server_1.4.200_image
```

The database can then be accessed using the following JDBC URL:

```
jdbc:h2:tcp://localhost:9092/yourdb
```

Don't forget to change the sa user's password by connection to the web console:

```browser
http://localhost:8082
```

Then logging in using jdbc connection credentials mentioned above and execute:

```web console
ALTER USER sa SET PASSWORD 'your new password';
```

(assuming your Docker host is also `localhost`)

### Data Volume

All data persisted by your h2 database running inside the container will be written to the docker volume 'h2-server_1.4.200' residing on the host. Therefore you easily back it up if you want to. Please refer to 'https://hub.docker.com/p/loomchild/volume-backup'.

### Configuration Options

* `JAVA_OPTIONS` - options to set when launching the H2 JVM - defaults to
an empty string
* `H2_OPTIONS` - additional options to pass when starting the H2 server
