#include <stdio.h>
#include <time.h>

struct {
  int a[5000];
  int b[5000];
} s;

int R[40000];

int main()
{
  int ii, i, X1, X2;
  
  for(i = 0; i < 5000; i++) s.a[i] = 1;
  for(i = 0; i < 5000; i++) s.b[i] = 2;
  
  struct timespec cgt1,cgt2; double ncgt;

  clock_gettime(CLOCK_REALTIME,&cgt1);
  
  for(ii = 0; ii < 40000;ii++){
    X1 = 0; X2 = 0;
    
    for(i = 0; i < 5000; i++) X1+=2*s.a[i]+ii;
    for(i = 0; i < 5000; i++) X2+=3*s.b[i]-ii;
    
    R[ii] = (X1 < X2) ? X1 : X2;
  }

  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double)((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("\nTiempo (seg.) = %11.9f\n", ncgt);
  printf("R[0] = %i, R[39999] = %i\n", R[0], R[39999]);
  /* for(i = 0; i < 12; i++) */
  /*   printf("R[%i] = %i\n",i,R[i]); */
  return 0;
}
