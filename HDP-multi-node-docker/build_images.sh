#!/bin/bash

# build images:

## ambari-server
docker build -t hdp/ambari-server ambari-server-template/

##ambari-agent
docker build -t hdp/ambari-agent ambari-agent-template/
