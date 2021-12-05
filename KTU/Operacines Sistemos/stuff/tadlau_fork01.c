#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

/* Tadas Laurinaitis IFF-6/8 tadlau */
/* Failas: tadlau_fork01.c */

int main( int argc, char * argv[] ){
	printf("haha nera vaiku \n");
	fork();
	printf("Tevas ir vaikas \n");
	fork();
	printf("visi sako ha \n");

}
