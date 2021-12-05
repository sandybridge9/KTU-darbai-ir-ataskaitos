#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

/* Tadas Laurinaitis IFF-6/8 tadlau */
/* Failas: tadlau_fork01.c */

int main( int argc, char * argv[] ){
	pid_t ppid, pid;
	//ppid = getppid();
	//pid = getpid();
	//printf("Sito proceso Tevo PID = %ld, Proceso PID = %ld\n", 
//(long)ppid,(long)pid);
	printf("--------------------------------------------------");
	int n;
	n = fork();
	if(n > 0){
		fork();
	}
	ppid = getppid();
	pid = getpid();
	printf("Tevo PID = %ld, Proceso PID = %ld\n", (long)ppid, 
(long)pid);
	return 0;
}
