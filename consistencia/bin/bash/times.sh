cd '/home/eee/MEGAsync/bio_comparada/consistencia/data/raw/farris'
#(time mpirun -np 4 poy /home/eee/MEGAsync/bio_comparada/consistencia/bin/poy/100.poy) &> /home/eee/MEGAsync/bio_comparada/consistencia/data/processed/times/100.poy.txt

tiempos=('100.poy' '1000.poy' ' 10000.poy')
for i in ${tiempos[*]};
do
  (time mpirun -np 4 poy /home/eee/MEGAsync/bio_comparada/consistencia/bin/poy/$i) &> /home/eee/MEGAsync/bio_comparada/consistencia/data/processed/times/$i'.txt'
done
