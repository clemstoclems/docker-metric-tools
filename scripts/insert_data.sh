#!/bin/bash
curl -i -XPOST 'http://influxdb_omnitools:8086/write?db=omnitools' --data-binary "omnitools_front,url=$1 global_score=$(tail -1 data/measures/global_score_$1.txt)"
curl -i -XPOST 'http://influxdb_omnitools:8086/write?db=omnitools' --data-binary "omnitools_front,url=$1 requests_score=$(tail -1 data/measures/requests_score_$1.txt)"
curl -i -XPOST 'http://influxdb_omnitools:8086/write?db=omnitools' --data-binary "omnitools_front,url=$1 pageweight_score=$(tail -1 data/measures/pageweight_score_$1.txt)"
curl -i -XPOST 'http://influxdb_omnitools:8086/write?db=omnitools' --data-binary "omnitools_front,url=$1 dommanipulations_score=$(tail -1 data/measures/dommanipulations_score_$1.txt)"
curl -i -XPOST 'http://influxdb_omnitools:8086/write?db=omnitools' --data-binary "omnitools_front,url=$1 badcss_score=$(tail -1 data/measures/badcss_score_$1.txt)"