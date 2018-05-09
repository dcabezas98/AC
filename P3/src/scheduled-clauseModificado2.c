#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv) {

  int i, n = 16,chunk, a[n],suma=0;

  if(argc < 2) {
    fprintf(stderr,"\nFalta chunk \n");
    exit(-1);
  }
  chunk = atoi(argv[1]);

  for (i=0; i<n; i++) a[i] = i;

  printf("\nFuera de parallel:\n");
  printf("num_threads: %d\n", omp_get_num_threads());
  printf("num_procs: %d\n", omp_get_num_procs());
  printf("in_parallel: %d\n", omp_in_parallel());

#pragma omp parallel for firstprivate(suma) lastprivate(suma) schedule(dynamic,chunk)
  for (i=0; i<n; i++)
    {
      if(i == 0){
	printf("\nDentro de parallel:\n");
	printf("num_threads: %d\n", omp_get_num_threads());
	printf("num_procs: %d\n", omp_get_num_procs());
	printf("in_parallel: %d\n", omp_in_parallel());
      }
      suma = suma + a[i];
      //printf(" thread %d suma a[%d] suma=%d \n",omp_get_thread_num(),i,suma);
    }
    
  //printf("Fuera de 'parallel for' suma=%d\n",suma);
}
