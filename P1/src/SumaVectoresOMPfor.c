#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#ifdef _OPENMP
   #include <omp.h> 
#else
   #define omp_get_thread_num() 0
#endif

//#define PRINTF_ALL

#define MAX 67108864 //=2^26
//#define MAX 4294967295 //=2^32-1
double v1[MAX], v2[MAX], v3[MAX]; 

int main(int argc, char** argv){ 
 
  int i;
  double cgt1, cgt2, ncgt; //para tiempo de ejecución

  //Leer argumento de entrada (nº de componentes del vector)
  if (argc<2){ 
    printf("Faltan nº componentes del vector\n");
    exit(-1);
  }
 
  unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

  if (N>MAX) N=MAX;

  //Inicializar vectores
#pragma omp parallel for
  for(i=0; i<N; i++){
    v1[i] = N*0.1+i*0.1; v2[i] = N*0.1-i*0.1; //los valores dependen de N
  }
  //Calcular suma de vectores
  cgt1 = omp_get_wtime();
#pragma omp parallel for
  for(i=0; i<N; i++)
    v3[i] = v1[i] + v2[i];

  cgt2 = omp_get_wtime();

  ncgt = cgt2 - cgt1;

  //Imprimir resultado de la suma y el tiempo de ejecución
#ifdef PRINTF_ALL
  printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,N); 
  for(i=0; i<N; i++) 
    printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",
	   i,i,i,v1[i],v2[i],v3[i]); 

#else
  printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",ncgt,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]); 
#endif

  return 0; 
}
