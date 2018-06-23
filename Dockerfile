FROM node:9

WORKDIR /opt

RUN git clone https://github.com/ldziedziul/timeoff-management.git timeoff-management 

WORKDIR /opt/timeoff-management
RUN npm install

EXPOSE 3000
VOLUME /opt/timeoff-management/config
ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "bash", "/docker-entrypoint.sh"]
