#!/bin/bash

export OMP_DYNAMIC=FALSE
export OMP_NUM_THREADS=8
export OMP_THREAD_LIMIT=8
export OMP_SCHEDULE="static,4"

./scheduled-clauseModificado 3

export OMP_DYNAMIC=TRUE
export OMP_NUM_THREADS=6
export OMP_THREAD_LIMIT=4
export OMP_SCHEDULE="dynamic"

./scheduled-clauseModificado 3
