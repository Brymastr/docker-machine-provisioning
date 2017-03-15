#!/bin/bash
KEY=$(cat api-key.txt)
echo "export VULTR_TOKEN=$KEY" >> ~/.bashrc
source ~/.bashrc