version: '3.7'

services:
   mysqldb:
     image: ozgurozturknet/webdb
     environment:
      MYSQL_DATABASE: proje
      MYSQL_USER: projemaster
      MYSQL_PASSWORD: master1234
      MYSQL_ROOT_PASSWORD: master1234
     networks:
      - webnet

   websrv:
     depends_on:
       - mysqldb
     image: ozgurozturknet/webkayit
     ports:
       - "80:80"
     restart: always
     networks:
       - webnet
     environment:
       DB_SERVER: mysqldb
       DB_USERNAME: projemaster
       DB_PASS: master1234
       DB_NAME: proje
networks:
  webnet:
    driver: bridge
