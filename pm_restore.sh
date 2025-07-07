cat $1 | docker exec -i pm-database-lcl psql postgresql://pm:pm@localhost:5432
