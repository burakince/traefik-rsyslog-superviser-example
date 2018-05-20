FROM burakince/traefik-rsyslog:1.0.0

RUN mkdir -p /var/log/supervisord \
  && mkdir -p /var/log/traefik \
  && touch /var/log/traefik/access.log

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY rsyslog.conf /etc/rsyslog.conf
COPY traefik.toml /etc/traefik/traefik.toml

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
