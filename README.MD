POC for PostgreSQL database running in docker

Part2 , with automatic db creation possibility

<br>
<br>
Uses Docker host volume mapping in : /home/mika/DOCKERDATA

Uses Docker backups mapping: /DOCKERBACKUPS
<br>
<br>

Start Postgres in docker:

docker-compose up

--------------------------------------------------

Dabatabase creation is executed when docker compose is ran.

Postgress itself does not execute init script if db exists

If existing db is found, initialization is not done

Create db content from host via shell (with override checking):

sudo docker exec -i testipossu psql -U mika -d cars < ./create_db.sql

---------------------------------------------------

Adminer, UI for db management: http://localhost:8100

----------------------------------------------------

Take timestampped db backup:
./backup.sh

----------------------------------------------------

Return backup:
./returnbackup.sh

----------------------------------------------------

Open SQL shell into Docker:
sudo docker exec -it -u postgres testipossu psql -U mika -d cars


------------------------------------------
QT directory includes small Qt(5.15) app to "access" database cars(showing SELECT * FROM cars;)

Qt Postgres may require driver installation:

sudo apt-get install libqt5sql5-psql libpq-dev

------------------------------------------------------------------
=================================================================0

Repo includes also another training database "customers" 
Customers db compose settings used via .env (not to be stored to public repo). No backuping/returning script for this db

DB Port in use: 5433
Adminer port in use: 8101

Setup:
docker-compose -f docker-compose-customers.yml up -d

Start with logs:
docker-compose -f docker-compose-customers.yml logs -f db


Stop:
docker-compose -f docker-compose-customers.yml down



Docker CLI usage:

docker exec -it asiakaspossu psql -U temppiuser -d customers

Use SQL:

customers=> SELECT * FROM customers;
