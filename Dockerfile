FROM ubuntu

RUN apt-get update -q

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy rsyslog

RUN mkdir /etc/rsyslog/ -p

RUN mv /etc/rsyslog.conf /etc/rsyslog/rsyslogd.conf.original
RUN mv /etc/rsyslog.d/ /etc/rsyslog/

ADD rsyslog/ /etc/rsyslog/

VOLUME ["/etc/rsyslog/",]

CMD ["rsyslogd", "-f", "/etc/rsyslog/rsyslog.conf", "-n"]

EXPOSE 514/tcp 514/udp