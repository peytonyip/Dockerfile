FROM jupyter/base-notebook

ARG custom_packages="black \
              dbutils \
              diagrams \
              elasticsearch \
              Faker \
              flake8 \
              minio \
              openpyxl \
              pymysql \
              pymongo \
              pooldb \
              pandas \
              pyecharts \
              redis \
              requests \
              XlsxWriter \
              yapf"

#COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/

USER root

RUN apt-get update && apt-get install --no-install-recommends -y graphviz; \
    rm -rf /var/lib/apt/lists/*;

USER ${NB_UID}

RUN pip install --quiet --no-cache-dir ${custom_packages}; \
    fix-permissions "${CONDA_DIR}"; \
    fix-permissions "/home/${NB_USER}"

