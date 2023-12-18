FROM nginx:1.25.3-alpine

RUN apk update && \
    apk upgrade && \
    apk add iptables

EXPOSE 80

ENTRYPOINT []

COPY ./start.sh /start.sh

RUN chmod +x /start.sh

CMD ["sh", "/start.sh"]