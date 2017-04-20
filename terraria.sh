#/bin/bash
#Created by Sam Gleske
#Wed Apr 19 19:22:34 PDT 2017
#Ubuntu 16.04.2 LTS
#Linux 4.4.0-72-generic x86_64
#GNU bash, version 4.3.46(1)-release (x86_64-pc-linux-gnu)

#DESCRIPTION
#  Starts a dedicated server for Terraria.


if [ ! -e serverconfig.txt ]; then
  echo "Missing serverconfig.txt." >&2
  echo "Recommended action:" >&2
  echo "  cp server/Linux/serverconfig.txt ./"
  exit 1
fi

cp -f serverconfig.txt server/Linux/
cd server/Linux

[ ! -x "./TerrariaServer.bin.x86_64" ] && \
  chmod 755 "./TerrariaServer.bin.x86_64"

./TerrariaServer.bin.x86_64 -config serverconfig.txt
