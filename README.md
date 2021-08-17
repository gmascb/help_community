# README

### Instaling with docker and compose
  * [Installing docker](https://docs.docker.com/engine/install/ubuntu/)
  * After docker is installed run
    * docker-compose up --build
      * now your service is built and running.
    * **To create/modify the databases in postgresql image run**
      * docker exec -it helping_community_web_1 sh
      * $ rake db:create
      * **Remember that every-time you make a new migration for the databases**
        * usefull commands:
          * rake db:drop
          * rake db:create
          * rake db:migrate
          * rake db:seed

  * Resolving Problems with POSTGRESQL
    * ```make exec_db``` to open postgresql image
    * ```psql -U postgres ``` to login psql
    * ```CREATE ROLE root WITH LOGIN PASSWORD '';```
    * ```ALTER USER root createdb;```
  
  * Scaffolds
    * Generate
      * ```rails generate scaffold Customer name:string```
      * ```rails g scaffold Order date:datetime customer:references```
    * Destroy
      * ```rails destroy scaffold Customer```
      * ```rails d scaffold Order```