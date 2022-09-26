FROM condaforge/mambaforge:4.14.0-0 as mamba

ADD .devcontainer/conda-linux-64.lock /locks/conda-linux-64.lock
RUN mamba create -p /opt/env --copy --file /locks/conda-linux-64.lock && mamba clean -aqy

COPY . /workspace/jouissance
RUN mamba run -p /opt/env python -m pip --disable-pip-version-check --no-cache-dir install /workspace/jouissance/

FROM ubuntu:22.04

COPY --from=mamba /opt/env /opt/env

ENV PATH=/opt/env/bin:$PATH
