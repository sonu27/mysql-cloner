FROM mysql/mysql-server:5.7

ADD ./clone.sh ./delete-all-tables.sql /

CMD ["sh", "/clone.sh"]
