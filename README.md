## Running an image.
``` 
docker pull python:3.7
docker pull python:3.7-slim
```

## Running an image.
``` 
docker run hello-world
```

## Building a custom image.
``` 
docker build -f server-v1.Dockerfile -t server:v1 .
docker run -p 8080:8080 server:v1
```

## Build properly
``` 
docker build -f server-v2.Dockerfile -t server:v2 .
```

## Building with reduced image size
``` 
mkfile -n 500m large_file.txt
docker build -f server-v3.Dockerfile -t server:v3-large-file .
docker build -f server-v3.Dockerfile -t server:v3 .
```

## Security
``` 
dive server:v4
snyk test --docker server:v4
docker build -f server-v4.Dockerfile -t server:v4 .
```

## Multi-stage builds
``` 
docker build -f server-v5.Dockerfile -t server:v5 .
```