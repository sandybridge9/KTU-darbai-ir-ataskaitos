/* Tadas Laurinaitis IFF 6/8  */
/* Failas: tadlau_sablonas.c */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int fn_getcwd();

int fn_getcwd(){

   char *cwd;
   cwd = getcwd( NULL, pathconf( ".", _PC_PATH_MAX) );
   puts( cwd );
   free( cwd );
   int filedesc = open(cwd, O_RDONLY);
   printf("%d \n", filedesc);
   return 1;
}

int main( int argc, char * argv[] ){
   //printf( "(C) 2018 Tadas Laurinaitis, %s\n", __FILE__ );
   fn_getcwd();
   return 0;
}
