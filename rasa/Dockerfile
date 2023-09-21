FROM alpine

ENV RASA_RELEASE=0.13.1 \
    RASA_NLU_HOME=/app \
    RASA_NLU_PYTHON_PACKAGES=/usr/local/lib/python2.7/dist-packages

# Installing deps
RUN apk --update add --virtual scipy-runtime python py-pip \
    && apk add --virtual scipy-build \
        build-base python-dev openblas-dev freetype-dev pkgconfig gfortran \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip install --upgrade pip
RUN pip install --no-cache-dir scipy \
    && apk add --virtual scipy-runtime \
        freetype libgfortran libgcc libpng  libstdc++ musl openblas tcl tk \
    && rm -rf /var/cache/apk/*
RUN apk add git bash --update-cache

# Installing Rasa
RUN wget -O - https://github.com/RasaHQ/rasa_nlu/archive/${RASA_RELEASE}.tar.gz | zcat | tar xvf -
RUN mv rasa_nlu-${RASA_RELEASE} ${RASA_NLU_HOME}

WORKDIR ${RASA_NLU_HOME}

# Installing SpaCy deps
RUN sed -i '/matplotlib/d' alt_requirements/requirements_bare.txt
RUN sed -i '/numpy/d' alt_requirements/requirements_bare.txt
RUN pip install -r alt_requirements/requirements_spacy_sklearn.txt
RUN pip install -e .

# Installing FR lang package
COPY ./models/fr.tar.gz ${RASA_NLU_HOME}
RUN pip install ${RASA_NLU_HOME}/fr.tar.gz
RUN python -m spacy link fr_model fr
RUN rm fr.tar.gz

# Installing EN lang package
COPY ./models/en.tar.gz ${RASA_NLU_HOME}
RUN pip install ${RASA_NLU_HOME}/en.tar.gz
RUN python -m spacy link en_model en
RUN rm en.tar.gz

RUN cp sample_configs/config_spacy_duckling.yml ${RASA_NLU_HOME}/config.yml

# Exposing resources
EXPOSE 5000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["start", "--path", "/app/projects", "-c", "config.yml", "--max_training_processes", "1"]
