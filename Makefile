.PHONY: all help list install

# Color highlighting for the shell
ccred = $(shell echo "\033[0;31m")
ccgreen = $(shell echo "\033[0;32m")
ccyellow = $(shell echo "\033[0;33m")
ccblue = $(shell echo "\033[0;34m")
ccend = $(shell echo "\033[0m")

MESURES="pageWeight,requests,domComplexity,domManipulations,scroll,badJavascript,jQuery,cssComplexity,badCSS,fonts,serverConfig"

all:
	@echo "$(ccyellow)Please choose a task or write 'make help' for help $(ccend)"

install:
ifeq ($(env),)
	@echo "$(ccred) Please choose an env to install the project.$(ccend)"
else
	@echo "$(ccblue)L env est $(env) $(ccend)"
	make create_db env=$(env)
	make create_dashboard env=$(env)
endif

create_db:
	echo "creating db measurments "
	echo "create database measurments \n" >> config/measurments_db.txt

create_dashboard:
	echo "creating dashboards "
	echo "" >> data/graf.json

include Makelaunch