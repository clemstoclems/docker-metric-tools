FROM httpd:2.4
LABEL maintainer="Clément Guinet <cguinet@omnilog.fr>"


COPY . /data/www/

RUN apt-get update
RUN apt-get install -y \
	apt-utils \
	nano \
	make \
	curl \
	python-apt \
	python
	
WORKDIR /data/www/