#!/bin/bash

# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8?permalink_comment_id=4690174#gistcomment-4690174
USERNAME='ModelioOpenSource'
REPO='Modelio'
VER=$(curl --silent -qI "https://github.com/${USERNAME}/${REPO}/releases/latest" | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}');
VER_WITHOUT_TAG=${VER//"v"/}
FILENAME="modelio-open-source-${VER_WITHOUT_TAG}_amd64.deb"
MODELIO="modelio-open-source-${VER_WITHOUT_TAG}"

wget "https://github.com/${USERNAME}/${REPO}/releases/download/${VER}/${FILENAME}"

dpkg --add-architecture amd64
dpkg --install ${FILENAME}

export MODELIO
