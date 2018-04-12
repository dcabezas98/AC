#!/bin/bash

for ((N=65536;N<67108865;N*=2))
do
	./SumaVectoresC_$1 $N
done
