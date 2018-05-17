#include <stdio.h>
#include <time.h>

#define N 1000
#define N2 1000000
 
int M1[N2];
int M2[N2];
int R[N2];

void printMatrix(int *M) {
  int i, j;
  for (i=0; i<N; i++) {
    for (j=0; j<N; j++)
      printf("%d ", M[i+j]);
    printf("\n");
  }
}

int main()
{

  int ii, i, j, k, suma;
  
  for(i = 0; i < N2; i++){
      M1[i] = 1;
      M2[i] = 2;
      R[i] = 0;
  }
  
  struct timespec cgt1,cgt2; double ncgt;
  
  clock_gettime(CLOCK_REALTIME,&cgt1);
  
  for(i = 0; i < N; i++)
    for(k = 0; k < N; k++)
      for(j = 0; j < N; j++)
	R[i*N+j] += M1[i*N+k] * M2[k*N+j];
       
  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("Tiempo = %11.9f\t R[0][0]=%d\t R[N-1][N-1]=%d\n",ncgt,R[0],R[N2-1]);

  //printMatrix(R);

  return 0;
}
