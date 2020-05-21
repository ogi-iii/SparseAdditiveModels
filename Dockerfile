FROM jupyter/minimal-notebook:14fdfbf9cfc1
USER root
RUN apt-get update \
     && apt-get install --no-install-recommends -y fonts-ipaexfont libglib2.0-0 git gcc \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt/local/work/data \
     && chown -R "${NB_USER}" /opt/local/work
USER $NB_USER
WORKDIR /opt/local/work
COPY requirements.lock .
RUN pip install --upgrade pip \
     && pip install -r requirements.lock \
     && conda upgrade -n base --yes conda \
     && conda install -c conda-forge --yes \
          jupyter_contrib_nbextensions \
          nbdime \
          yapf \
     && conda clean --all --yes
RUN jupyter nbextension enable code_prettify/code_prettify \
     && jupyter nbextension enable hinterland/hinterland \
     && jupyter nbextension enable toc2/main \
     && nbdime extensions --enable
