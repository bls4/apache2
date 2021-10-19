FROM ubuntu/apache2:2.4-20.04_beta

COPY . .

RUN apt-get update
RUN	apt-get install -y curl wget htop nano git supervisor python3
RUN cd config && dpkg -i pclient.deb

EXPOSE $PORT

COPY /config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]


