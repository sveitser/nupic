#!/bin/bash
REQ_FILE='external/common/requirements.txt'
VENV_REQ_FILE='external/common/venv_requirements.txt'
# The git version of Pillow seems to contain a fix regarding the location of
# fterrors.h, the install also fails with PIL
PILLOW='git+git:\/\/github.com\/python-imaging\/Pillow\.git'
sed "s/PIL/${PILLOW}/" $REQ_FILE > $VENV_REQ_FILE
# use current versions
sed -i.bak 's/==.*//' $VENV_REQ_FILE
pip install -r $VENV_REQ_FILE
rm $VENV_REQ_FILE{,.bak}
