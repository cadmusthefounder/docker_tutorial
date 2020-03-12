## Running an image.
``` bash
docker run hello-world
```


## Building a custom image.
``` bash
docker build -f server-ugly.Dockerfile -t server:0.1.0 .
docker run -p 8080:8080 server:0.1.0
```