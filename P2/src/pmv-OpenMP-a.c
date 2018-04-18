/* 
   Multiplica una matriz por un vector
*/ 

#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h> // biblioteca donde se encuentra la función clock_gettime()

#ifdef _OPENMP
   #include <omp.h> 
#else
   #define omp_get_thread_num() 0
#endif

#define PRINTF_ALL// comentar para quitar el printf ...
// que imprime todos los componentes

int main(int argc, char** argv){ 
 
  int i, j;
  struct timespec cgt1,cgt2; double ncgt; //para tiempo de ejecución

  //Leer argumento de entrada (nº de componentes del vector)
  if (argc<2){ 
    printf("Falta tamaño\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);

  double *v1;
  double *v2;
  double **M;
  v1 = (double*) malloc(N*sizeof(double));// malloc necesita el tamaño en bytes
  v2 = (double*) malloc(N*sizeof(double));
  M = (double**) malloc(N*sizeof(double*));

  for(i = 0; i < N; i++)
    M[i] = (double*) malloc(N*sizeof(double));

  for(i=0; i<N; i++){ 
    v1[i] = N*0.1+i*0.1;
    for(j=0; j<N; j++)
      M[i][j] = N*0.1-j*0.1;
  } 

  double suma;
  clock_gettime(CLOCK_REALTIME,&cgt1);

  for(i = 0; i < N; i++){
    suma = 0;
    for(j = 0; j < N; j++)
      suma += M[i][j]*v1[j];
    v2[i] = suma;
  }

  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
    (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  //Imprimir resultado y el tiempo de ejecución
#ifdef PRINTF_ALL
  printf("Tiempo(seg.):%11.9f\t / Tamaño:%u\n",ncgt,N); 

  printf("Resulado:\n");
    for(i=0; i<N; i++) 
      printf("V[%d] = %8.6f /",i,v2[i]);
    printf("\n");

#else
  printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ V[0]=%8.6f / / V[%d]=%8.6f /\n",ncgt,N,v2[0],N-1,v2[N-1]); 
#endif

  free(v1); // libera el espacio reservado para v1
  free(v2); // libera el espacio reservado para v2

  for(i = 0; i < N; i++)
    free(M[i]);

  free(M);
  
  return 0; 
}
