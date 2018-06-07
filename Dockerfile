FROM mysql/mysql-server:5.7

ADD ./clone.sh /

ENTRYPOINT ["sh"]

CMD ["sh", "/clone.sh"]
