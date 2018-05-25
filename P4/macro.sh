#!/bin/bash

k=100000

salida='tiempos.dat'

echo "" > $salida

while [[ k -le 2500000 ]]
do
    ./daxpy $k >> $salida
    k=$[$k+100000]
done
