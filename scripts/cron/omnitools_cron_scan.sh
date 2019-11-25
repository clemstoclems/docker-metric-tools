#!/bin/bash
url=$1
echo "starting"
docker exec application_tools sh -c "make launch_scan url=$url"
echo "finishing"

