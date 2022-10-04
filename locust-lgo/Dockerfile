ARG PYTHON_VERSION=3.10.1-alpine3.15

FROM python:${PYTHON_VERSION} as builder

ENV PYTHONUNBUFFERED 1

# build time dependencies
RUN apk update && \
        apk add --no-cache \
        gcc \
        g++ \
        musl-dev \
        linux-headers \
        zeromq-dev \
        libffi-dev \
        make

# build wheels instead of installing
WORKDIR /wheels

COPY requirements.txt .

RUN pip install -U pip && \
    pip wheel -r requirements.txt


FROM python:${PYTHON_VERSION}

# dependencies you need in your final image
RUN apk update && \
    apk add --no-cache \
        # good to have bash available
        bash \
        # locustio doesn't start without it
        libzmq

# copy built previously wheels archives
COPY --from=builder /wheels /wheels

COPY requirements.txt /wheels/requirements.txt

# use archives from /weels dir
RUN pip install -U pip \
       && pip install -r /wheels/requirements.txt -f /wheels \
       && rm -rf /wheels \
       && rm -rf /root/.cache/pip/*


RUN mkdir -p /home/locust
WORKDIR /home/locust

COPY . .

EXPOSE 8089 5557

ENTRYPOINT ["locust"]

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
