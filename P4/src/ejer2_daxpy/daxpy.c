#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
  int i, X1, X2;
  const double a = 6143.438;
  
  int N = atoi(argv[1]);

  double *y = malloc(N*sizeof(double));
  double *x = malloc(N*sizeof(double));
  
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
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("\nTiempo (seg.) = %11.9f\n", ncgt);
  printf("y[0] = %11.9f, y[%i] = %11.9f\n", y[0], N-1, y[N-1]);

  return 0;
}
