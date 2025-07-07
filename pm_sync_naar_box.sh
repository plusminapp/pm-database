docker exec -t pm-database-lcl pg_dump -c -U pm pm | ssh box 'docker exec -i pm-database-dev psql postgresql://pm:pm@localhost:5432'

