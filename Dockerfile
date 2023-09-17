FROM tomsquest/docker-radicale

RUN apk add calcurse
RUN apk add python3
RUN apk add py3-pip
RUN apk add tmux

RUN pip install httplib2



WORKDIR /root/.local/share/calcurse/caldav

COPY sync.db .

WORKDIR /root/.config/calcurse/caldav

COPY calcurse-caldav.py .
COPY config .

ENTRYPOINT ["./calcurse-caldav.py"]