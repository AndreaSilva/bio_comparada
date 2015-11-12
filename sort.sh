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
grep ">" FILE_NAME | sed 's/_/,/g' | sed 's/>//g' > salida.txt
#sort by country and create an output file
sort -k 2 -t "," salida.txt > sort_country.csv
#sort by year and create an output file
sort -k 3 -t "," salida.txt > sort_year.csv
# create header of files
sed -l 1 -i  \1i'ID,ISO,YEAR' sort_country.csv
sed -l 1 -i  \1i'ID,ISO,YEAR' sort_year.csv
#remove unnecessary files
rm salida.txt
#philosophical phrase:
echo "A estudiar para luchar a luchar para estudiar"
