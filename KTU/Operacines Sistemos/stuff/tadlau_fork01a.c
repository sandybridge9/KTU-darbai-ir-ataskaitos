#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

/* Tadas Laurinaitis IFF-6/8 tadlau */
/* Failas: tadlau_fork01.c */

int main( int argc, char * argv[] ){
	pid_t child;
	int n;
	n = fork();
	if(n == 0){
		fork();
	}
	printf("ha \n");
	return 0;
}
