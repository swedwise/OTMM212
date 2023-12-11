FROM google/cloud-sdk:alpine

ENV USER=bkuser
ENV UID=1000
ENV GID=1000
ENV BAK_SRC="/backup"
ENV SLEEPTIME=3600

WORKDIR "/home/$USER"

RUN /usr/sbin/addgroup --gid "$GID" bkuser && \
    /usr/sbin/adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$USER" \
    --uid "$UID" \
    "$USER"

ADD backup.sh /app/backup.sh
RUN chmod +x /app/backup.sh
RUN chown bkuser:bkuser /app/backup.sh

USER bkuser

ENTRYPOINT ["/app/backup.sh"]
