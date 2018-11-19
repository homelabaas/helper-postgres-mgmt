#!/bin/sh

mc config host add minio $MINIO_URL $MINIO_ACCESS_KEY $MINIO_SECRET_KEY 

case "$OPERATION" in
 BACKUP)
    /usr/bin/pg_dump -C -h $POSTGRES_ADDRESS -p $POSTGRES_PORT -U $POSTGRES_USER $POSTGRES_DB > /tmp/out.sql
    mc cp /tmp/out.sql minio/$MINIO_BUCKET/pgsql_backup/$POSTGRES_ADDRESS/$POSTGRES_DB/backup.sql
    ;;
 RESTORE)
   mc cp minio/$MINIO_BUCKET/pgsql_backup/$POSTGRES_ADDRESS/$POSTGRES_DB/backup.sql /tmp/out.sql
   cat /tmp/out.sql | /usr/bin/psql -h ${target.address} -p ${target.port} -U ${target.user}
   ;;
esac