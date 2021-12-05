/* Tadas Laurinaitis IFF 6/8  */
/* Failas: tadlau_sablonas.c */

#include <stdio.h>
#include <unistd.h>

int main( int argc, char * argv[] ){
   printf("(C) 2018 Tadas Laurinaitis, %s\n", __FILE__);
   printf("%ld \n", pathconf("..", _PC_NAME_MAX));
   printf("%ld \n", pathconf("..", _PC_PATH_MAX));
   return 0;
}
