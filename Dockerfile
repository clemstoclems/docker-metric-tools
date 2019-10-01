FROM httpd:2.4
LABEL maintainer="Clément Guinet <cguinet@omnilog.fr>"


COPY . /data/www/

RUN apt-get update
RUN apt-get install nano \
	&& apt-get install make \
	&& apt-get install curl \
	&& apt-get install python-apt \
    && apt-get install python \

WORKDIR /data/www/