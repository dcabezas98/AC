#include <stdio.h>
#include <time.h>

// Declaración de variables
#define N 20000
const int a = 6143;
int y[N];
int x[N];

int main()
{
  int i, X1, X2;

  //Inicialización
  for(i = 0; i < N; i++){
    x[i] = 7;
    y[i] = 63;
  }
  
  struct timespec cgt1,cgt2; double ncgt;

  clock_gettime(CLOCK_REALTIME,&cgt1);

  // Cálculos
  for(i = 0; i < N; i++)
    y[i] += a*x[i];

  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("\nTiempo (seg.) = %11.9f\n", ncgt);
  printf("y[0] = %i, y[%d] = %i\n", y[0], N-1, y[N-1]);
  /*
  for(i = 0; i < N; i++)
    printf("y[%d] = %d\n", i, y[i]);
  */
  return 0;
}
