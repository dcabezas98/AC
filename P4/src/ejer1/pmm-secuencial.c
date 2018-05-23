#include <stdio.h>
#include <time.h>

#define N 1000

int M1[N][N];
int M2[N][N];
int R[N][N];

int ii, i, j, k, suma;

int main()
{
  for(i = 0; i < N; i++){
    for(j = 0; j < N; j++){
      M1[i][j] = 1;
      M2[i][j] = 2;
      R[i][j] = 0;
    }
  }
  
  struct timespec cgt1,cgt2; double ncgt;

  clock_gettime(CLOCK_REALTIME,&cgt1);
  
  for(i = 0; i < N; i++){
    for(j = 0; j < N; j++){
      for(k = 0; k < N; k++){
	R[i][j] += M1[i][k]*M2[k][j];
      }
    }
  }
  
  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("Tiempo = %11.9f\t R[0][0]=%d\t R[N-1][N-1]=%d\n",ncgt,R[0][0],R[N-1][N-1]);

  return 0;
}
