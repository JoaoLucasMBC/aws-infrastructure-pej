#!/bin/bash

sudo curl -sO https://packages.wazuh.com/4.9/wazuh-install.sh
sudo curl -sO https://packages.wazuh.com/4.9/config.yml

# Customize tthe config.yml file
sudo cat <<EOF > ./config.yaml
nodes:
  # Wazuh indexer nodes
  indexer:
    - name: node-1
      ip: "localhost"
    #- name: node-2
    #  ip: "localhost"
    #- name: node-3
    #  ip: "localhost"

  # Wazuh server nodes
  # If there is more than one Wazuh server
  # node, each one must have a node_type
  server:
    - name: wazuh-1
      ip: "localhost"
    #  node_type: master
    #- name: wazuh-2
    #  ip: "localhost"
    #  node_type: worker
    #- name: wazuh-3
    #  ip: "localhost"
    #  node_type: worker

  # Wazuh dashboard nodes
  dashboard:
    - name: dashboard
      ip: "localhost"
EOF

bash wazuh-install.sh --generate-config-files
bash wazuh-install.sh --wazuh-indexer node-1
bash wazuh-install.sh --start-cluster

# Server
bash wazuh-install.sh --wazuh-server wazuh-1

# Dash
bash wazuh-install.sh --wazuh-dashboard dashboard