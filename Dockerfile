version: '3.7'

services:
   mysqldb:
     image: aytacyu/webdb
     environment:
      MYSQL_DATABASE: project
      MYSQL_USER: projectmaster
      MYSQL_PASSWORD: master1234
      MYSQL_ROOT_PASSWORD: master1234
     networks:
      - webnet

   websrv:
     depends_on:
       - mysqldb
     image: aytacyu/websrv
     ports:
       - "80:80"
     restart: always
     networks:
       - webnet
     environment:
       DB_SERVER: mysqldb
       DB_USERNAME: projectmaster
       DB_PASS: master1234
       DB_NAME: project
networks:
  webnet:
    driver: bridge
