FROM nvcr.io/nvidia/tensorflow:22.10-tf2-py3

RUN pip3 --disable-pip-version-check --no-cache-dir install -U pip

COPY .devcontainer/requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r \
    /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp

COPY . /workspace/jouissance
RUN pip3 --disable-pip-version-check --no-cache-dir install /workspace/jouissance/
