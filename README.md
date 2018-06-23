# timeoff-management-docker-compose
Docker Compose configuration for https://github.com/ldziedziul/timeoff-management. Includes nginx proxy for ssl support

Based on https://github.com/thperret/timeoff-management_docker

## Prerequisites 
- [Docker 17.09.0+](https://docs.docker.com/install/linux/docker-ce/ubuntu)
- [Docker Compose 1.17.0+](https://docs.docker.com/compose/install/#install-compose)

## Run
- copy `.env.template` to `.env` and edit it environment variables
- create `ssl` directory and put there `cert.pem` and `key.pem` for ssl purposes
- run `docker-compose up -d --build`

### Environment variables

You can set the following variables to configure the `timeoff` application:

 Variable name | Configuration | Default | Possible values | Remarks
---------------|---------------|---------|-----------------|---------
`NODE_ENV` | Set environment | `development` | `development`, `production`, `test` | You should always use `production`
`SENDER_MAIL` | Mails from | None | email address | Needed for enabling mail sending
`SMTP_HOST` | smtp server host | None | host | Needed for enabling mail sending
`SMTP_PORT` | smtp server port | None | port | Needed for enabling mail sending
`SMTP_USER` | smtp username | None | username/address | Needed for enabling mail sending
`SMTP_PASSWORD` | smtp password | None | password | Needed for enabling mail sending
`APP_URL` | Set application URL in sent mails | `http://app.timeoff.management` | URL | You should set this
`PROMOTION_URL` | Set url in footer mails | `http://timeoff.management` | URL | You can change this if you want footer mail link to redirect to your hosted application
`ALLOW_ACCOUNTS_CREATION` | Enable/Disable public companies account creation | `true` | `true` , `false` | You need to enable account creation at least on first run to create your company. You can disable it afterwards and restart the container

## Upgrade
- stop application first:
```bash
docker-compose stop
```
- rebuild image and recreate containers:
```bash
docker-compose build --no-cache
docker-compose up -d
```

## More info:
- https://timeoff.management
- https://github.com/timeoff-management/application
