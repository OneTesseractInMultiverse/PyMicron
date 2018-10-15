#!/usr/bin/env bash

if [ -d "venv" ]; then
  rm -rf venv
fi

virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt
