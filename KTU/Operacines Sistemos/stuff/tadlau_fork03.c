#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

/* Tadas Laurinaitis IFF-6/8 tadlau */
/* Failas: tadlau_fork01.c */

int main( int argc, char * argv[] ){
   int i;
   int k;
   printf("Tevas \n");
   i = fork();
   if(i == 0){
      printf("Sukurtas vaikas \n");
      k = fork();
      if(k == 0){
         printf("Sukurtas anukas \n");
         system("ps");
      }
   }
   return 0;
}
