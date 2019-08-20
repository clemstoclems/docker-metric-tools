.PHONY: all help list install

# Color highlighting for the shell
ccred = $(shell echo "\033[0;31m")
ccgreen = $(shell echo "\033[0;32m")
ccyellow = $(shell echo "\033[0;33m")
ccblue = $(shell echo "\033[0;34m")
ccend = $(shell echo "\033[0m")

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
	echo "create database measurments \n" >> data/measurments_db.txt

create_dashboard:
	echo "creating dashboards "
	echo "" >> data/graf.json

#include Makelaunch

launch_scan:
ifeq ($(url),)
	@echo "$(ccred) Please provide an url to scan ! $(ccend)"
else
	make launch_yellow_lab_scan url=$(url)
endif

launch_yellow_lab_scan:
	curl -X POST -H "Content-Type: application/json" -d '{"url":"${url}", "waitForResponse":"true"}' "localhost:8383/api/runs" | sed 's/Found. Redirecting to *//' >> data/measures/path_${url}.txt
	make get_results_api file=data/measures/path_${url}.txt
	rm data/measures/path_${url}.txt

get_results_api:
	curl -s "localhost:8383$$(cat ${file})" >> data/measures/result_${url}.json
	cat data/measures/result_${url}.json | python -c "import sys, json; print json.load(sys.stdin)['scoreProfiles']['generic']['globalScore']" >> data/measures/score_${url}.txt
	rm data/measures/result_${url}.json
	./scripts/insert_data.sh
