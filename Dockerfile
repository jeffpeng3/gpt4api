from python:3.12-alpine as base

FROM base as builder
RUN apk add build-base
RUN pip install --user g4f[all]

FROM base
COPY --from=builder /root/.local /root/.local

CMD ["/bin/sh","-c","python3 -m g4f.api.run"]