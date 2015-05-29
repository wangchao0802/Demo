#import "test.c"
#include <stdio.h>

int main(int argc, char *argv[]) 
{
	int var =20;
	int *ip = &var;

		printf("%x\n", ip);
		printf("%d \n", *ip);

	
}