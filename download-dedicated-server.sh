#!/bin/bash
#Created by Sam Gleske
#Wed Apr 19 19:22:34 PDT 2017
#Ubuntu 16.04.2 LTS
#Linux 4.4.0-72-generic x86_64
#GNU bash, version 4.3.46(1)-release (x86_64-pc-linux-gnu)
#curl 7.47.0 (x86_64-pc-linux-gnu) libcurl/7.47.0 GnuTLS/3.5.5 zlib/1.2.8 libidn/1.32 librtmp/2.3
#UnZip 6.00 of 20 April 2009, by Debian. Original by Info-ZIP.

#DESCRIPTION
#  Downloads and extracts terraria dedicated server to the server/ dir.

download_server() {
  [ -f download-utilities.sh ] && ./download-utilities.sh "$@" || download-utilities.sh "$@"
}

if ! type -P download-utilities.sh &> /dev/null; then
  curl -sSfLO https://raw.githubusercontent.com/samrocketman/yml-install-files/main/download-utilities.sh
  chmod 755 download-utilities.sh
fi

download_server --update terraria.yaml
if ! git diff --exit-code &> /dev/null; then
  download_server --checksum -I any:any terraria.yaml
fi
download_server terraria.yaml
