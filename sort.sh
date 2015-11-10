#!/bin/bash
# created by: Daniel Pabón
#email: daniel.epm12@gmail.com
#* ----------------------------------------------------------------------------
#* "THE BEER-WARE LICENSE" (Revision 42):
#* <daniel.epm12@gmail.com> wrote this file.  As long as you retain this notice you
#* can do whatever you want with this stuff. If we meet some day, and you think
#* this stuff is worth it, you can buy me a beer in return.
#*                                                              Daniel Pabón
#* ----------------------------------------------------------------------------

#Considerations:
#The descriptions lines in fasta file have the structure:
#>ID_ISO_YEAR

#Please replace FILE_NAME with the route and file .fasta
#the script search all lines that have ">". Change the simbol "_" with ";",remove ">" and create an ouput file
grep ">" DNAdata.fas | sed 's/_/,/g' | sed 's/>//g' > salida.txt
#cut the first column in a new file
cut -f 1 -d "," salida.txt > id.txt
#cut the second column in a new file
cut -f 2 -d "," salida.txt > country.txt
#cut the third column in a new file
cut -f 3 -d "," salida.txt > year.txt
#paste the columns, sort by year and create an output file
paste -d "," country.txt id.txt year.txt | sort > sort_country.csv
#paste the columns, sort by country and create an output file
paste -d "," year.txt id.txt country.txt | sort > sort_year.csv
# create header of files
sed -l 1 -i  \1i'ISO,ID,YEAR' sort_country.csv
sed -l 1 -i  \1i'YEAR,ID,ISO' sort_year.csv
#remove unnecessary files
rm salida.txt id.txt country.txt year.txt
#philosophical phrase:
echo "A estudiar para luchar a luchar para estudiar"
