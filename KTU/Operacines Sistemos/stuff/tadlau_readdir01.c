#include <stdio.h>
#include <sys/types.h>
#include <dirent.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

/* Tadas Laurinaitis IFF-6/8 tadlau */
/* Failas: tadlau_fork01.c */

int readdir();

int readdir(){
   char *cwd;
   cwd = getcwd( NULL, pathconf( ".", _PC_PATH_MAX) );
   puts( cwd );
   int opn;
   opn = open(cwd, O_RDONLY );
   free( cwd );
   return opn;
}

int main( int argc, char * argv[] ){
   int dskr;
   dskr = readdir();
   fdopendir(dskr);
   return 0;
}
