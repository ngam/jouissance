FROM mcr.microsoft.com/devcontainers/python:3.10

RUN pip3 --disable-pip-version-check --no-cache-dir install -U pip

COPY .devcontainer/requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r \
    /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp

COPY . /workspaces/jouissance/
RUN pip3 --disable-pip-version-check --no-cache-dir install -e "/workspaces/jouissance/[dev]"
