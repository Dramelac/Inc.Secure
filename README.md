# Inc.Secure

## Awesome Ultra Secure Blog

> This web application is intentionally vulnerable for training and practice purposes

## How to setup

- Clone repository
```
git clone https://github.com/Dramelac/Inc.Secure.git
```
- Build custom images
```
docker-compose build
```
- Create & start application
```
docker-compose up -d
```
- Stop / start application
```
docker-compose stop
docker-compose start
```
- Remove application
```
docker-compose down -v
```

## Targets

- Dump database content
- Access internal (shadow) web service on port 8080
