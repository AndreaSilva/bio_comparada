#!/bin/bash

grep ">" DNAdata.fas | sed -e 's/_/;/g' | sed 's/>//g' > salida.txt
cut -f 2 -d ";" | cut -f 3 -d ";"| paste salida2.txt
