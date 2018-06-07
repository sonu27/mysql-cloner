set -e

echo "Copying database - $SOURCE_DB_HOST to $DEST_DB_HOST"

# https://medium.com/@inanbunyamin90/how-to-drop-all-tables-in-mysql-f711774b6645
cat delete-all-tables.sql \
    | mysql \
        --host=${DEST_DB_HOST} \
        --port=${DEST_DB_PORT} \
        --user=${DEST_DB_USER} \
        --password=${DEST_DB_PASS} \
        --database=${DEST_DB_DATABASE}

mysqldump \
    --host=${SOURCE_DB_HOST} \
    --port=${SOURCE_DB_PORT} \
    --user=${SOURCE_DB_USER} \
    --password=${SOURCE_DB_PASS} \
    --add-drop-table \
    --single-transaction=TRUE \
    ${SOURCE_DB_DATABASE} \
    | mysql \
    --host=${DEST_DB_HOST} \
    --port=${DEST_DB_PORT} \
    --user=${DEST_DB_USER} \
    --password=${DEST_DB_PASS} \
    --database=${DEST_DB_DATABASE}

echo "Finished - $SOURCE_DB_HOST to $DEST_DB_HOST"
