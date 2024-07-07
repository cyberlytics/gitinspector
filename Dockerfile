# syntax = docker/dockerfile:1.2

FROM python:3.12 AS builder
# https://hub.docker.com/_/python

RUN apt-get update \
 && apt-get install -yqq --no-install-recommends git make flake8 pylint tree

ENV PYTHONUNBUFFERED=1

RUN python -m venv /opt/venv
ENV PATH=/opt/venv/bin:$PATH

RUN python -m ensurepip --upgrade \
 && pip install --no-cache-dir --upgrade pip build pytest coverage
 
ADD . /wsp/gitinspector/
WORKDIR /wsp/gitinspector

RUN make clean \
 && make install \
 && make dist
 
#RUN make lint \
# && make test \
# && make test-coverage


# pre-compile pyc files by running gitinspector on empty temporary git repo
RUN git init --quiet ./empty \
 && python gitinspector.py ./empty

# print out complete structure and files
RUN tree -a /wsp

# =====================================

FROM python:3.12-slim as runner
# https://hub.docker.com/_/python

LABEL Maintainer="Christoph P. Neumann"

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
	--mount=type=cache,target=/var/tmp \
	apt-get update \
 && apt-get install -yqq --no-install-recommends git tree

COPY --from=builder /wsp/gitinspector /wsp/gitinspector
WORKDIR /wsp/gitinspector
ENV PIP_CACHE_DIR=/var/cache/buildkit/pip
RUN mkdir -p $PIP_CACHE_DIR
RUN --mount=type=cache,target=/var/cache/buildkit/pip \
    pip install .
WORKDIR /
RUN rm -r /wsp/gitinspector

ENV USER=app
ENV GROUPNAME=$USER
ENV UID=10000
ENV GID=10001

RUN groupadd \
    --gid $GID \
    $GROUPNAME \
 && useradd \
	--create-home \
	--gid $GID \
	--uid $UID \
    $USER
RUN mkdir /repo && chown -R $USER:$GROUPNAME /repo
USER $USER:$GROUPNAME

RUN git config --global merge.renamelimit 0 \
 && git config --global diff.renamelimit 0 \
 && git config --global gc.auto 0 \
 && git config --global gc.pruneExpire never \
 && git config --global gc.reflogExpire never \
 && git config --global gc.autodetach false \
 && git config --global --add safe.directory /repo

ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8

WORKDIR /repo
ENTRYPOINT ["gitinspector"]
