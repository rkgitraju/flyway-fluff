-- window : set timezone.
$env:MAVEN_OPTS="-Duser.timezone=Asia/Kolkata"
$env:PYTHONWARNINGS = "ignore"

-- run single profile
mvn clean compile flyway:migrate -Pdb1-local

-- repair flyway 
mvn flyway:repair -Pdb2-local

-- compare schema
migra --unsafe postgresql://airflow:airflow@localhost:5432/db2 postgresql://airflow:airflow@localhost:5432/db1



-- setup with jenkins.
1. Dockerfile
2. docker-compose.yml