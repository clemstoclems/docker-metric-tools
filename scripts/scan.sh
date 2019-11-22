cat result_omnilog.fr.json | python -mjson.tool | grep globalScore

cat result_omnilog.fr.json | python -c "import sys, json; print json.load(sys.stdin)['scoreProfiles']['generic']['globalScore']"


influx -import -path=NOAA_data.txt -precision=s -database=NOAA_water_database


##commande sh pour recuperer le json d analyse en curl

## commande sh pour extraire la note globale

##commande sh pour ajouter cette note globale a la bdd measurments

