FROM alpine:edge as base

RUN echo 'PyYAML>=3.13' > /requirements.txt

RUN apk add --no-cache gcc make python3 libedit-dev musl-dev git

RUN python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache && \
    pip install -r /requirements.txt

RUN git clone https://gitlab.com/esr/open-adventure.git src && cd /src && make

COPY make_dungeon_go.py /src
COPY defines.go.tpl dungeon.go.tpl /src/templates/

WORKDIR /src
RUN ./make_dungeon_go.py
