#!/bin/bash

for ((N=16384;N<67108865;N*=2))
do
	./SumaVectores$1 $N
done
