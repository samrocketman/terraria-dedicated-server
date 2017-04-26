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

#obtain the dedicated server URL
terraria_url="https://terraria.org"
ds_url="$(curl -sL https://terraria.org/ | grep -Eo $'[^\'"]+terraria-server-[^\'"]+')"

if [ ! -d 'server' ]; then
  mkdir server
else
  rm -rf server.old
  mv server server.old
  mkdir server
fi

cd server

curl -Lo dedicated-server.zip "${terraria_url}/${ds_url#/}"

unzip dedicated-server.zip

if [ ! -d Linux ]; then
  DIR="$(ls -1 | grep -v dedicated-server.zip)"
  mv "$DIR"/* ./
  rmdir "$DIR"
fi
