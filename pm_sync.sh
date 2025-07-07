ssh box 'docker exec -t pm-database-dev pg_dump -c -U pm pm' | docker exec -i pm-database-lcl psql postgresql://pm:pm@localhost:5432

