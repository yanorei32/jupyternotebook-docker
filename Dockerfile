FROM nvidia/cuda:11.4.2-runtime-ubuntu20.04

MAINTAINER yanorei32
EXPOSE 8080
WORKDIR /work
COPY Pipfile /work
COPY Pipfile.lock /work
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

RUN set ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		python3 python3-pip zlib1g libjpeg-turbo8 libgomp1 git unzip wget curl; \
	savedAptMark="$(apt-mark showmanual)"; \
	apt-get install -y --no-install-recommends \
		python3-dev zlib1g-dev libjpeg-dev gcc; \
	CC="gcc -O3 -march=native" pipenv install; \
	apt-mark auto '.*' > /dev/null; \
	[ -z "$savedAptMark" ] || apt-mark manual $savedAptMark; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	rm -rf /var/lib/apt/lists/*;

CMD [ \
    "jupyter", \
    "notebook", \
    "--port", "8080", \
    "--allow-root", \
    "--ip=0.0.0.0", \
    "--NotebookApp.token=password", \
	"--NotebookApp.allow_origin=*" ]
