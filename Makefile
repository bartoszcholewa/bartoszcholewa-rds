WDAY_HOUR=`date +"%u_%H"`
HOUR=`date +"%H"`

include .env
export

backup_db:
	@docker run --rm -e PGPASSWORD=${POSTGRES_PASSWORD} postgres:alpine pg_dump -h ${POSTGRES_HOST} -p 5432 -d ${POSTGRES_DB} -U ${POSTGRES_USER} \
	> ~/_temp.sql
	@gzip -c ~/_temp.sql > ~/DB_BACKUP_-$(WDAY_HOUR).sql.gz
	@rm ~/_temp.sql
