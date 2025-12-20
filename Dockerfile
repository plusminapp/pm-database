ARG POSTGRES_PASSWORD
FROM postgres:16-alpine3.22

ENV POSTGRES_USER=pm
ENV POSTGRES_DB=pm
ENV LANG=nl_NL.utf8

USER root

# Install locale packages for Alpine
RUN apk add --no-cache musl-locales musl-locales-lang

# Set up directories and permissions for postgres user (UID 999)
RUN mkdir -p /var/run/postgresql && \
    chown postgres:postgres /var/run/postgresql && \
    chmod 2775 /var/run/postgresql

COPY resources/.pgpass /var/lib/postgresql/.pgpass
RUN chown postgres:postgres /var/lib/postgresql/.pgpass && \
    chmod 0600 /var/lib/postgresql/.pgpass

COPY resources/db-init/db-init.sql /docker-entrypoint-initdb.d/db-init.sql
RUN chown postgres:postgres /docker-entrypoint-initdb.d/db-init.sql && \
    chmod 0644 /docker-entrypoint-initdb.d/db-init.sql

ENV LANG=nl_NL.UTF-8
ENV LC_ALL=nl_NL.UTF-8

USER postgres

EXPOSE 5432
