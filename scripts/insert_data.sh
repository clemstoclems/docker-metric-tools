#!/bin/bash
curl -i -XPOST 'http://localhost:8086/write?db=omnitools' --data-binary "omnitools_front,url=$1 global_score=$(tail -1 data/measures/global_score_$1.txt)"
