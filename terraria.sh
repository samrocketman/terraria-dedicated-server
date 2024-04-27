#/bin/bash
# Created by Sam Gleske
# Sat Apr 27 04:02:19 PM EDT 2024
# Pop!_OS 22.04 LTS
# Linux 6.6.10-76060610-generic x86_64
# GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)

#DESCRIPTION
#  Starts a dedicated server for Terraria.

cd terraria

if [ -f ../serverconfig.txt ]; then
  ./TerrariaServer -config ../serverconfig.txt "$@"
else
  ./TerrariaServer "$@"
fi
