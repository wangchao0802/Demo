#include <stdio.h>
#import "test.c"

extern int test  ;
static int b =2;

void testF ()
{	
	b++;
	printf(" b %d\n", b);
}

int main(int argc, char const *argv[])
{
	printf("hello word %d \n",test);
	// auto int b ;
	printf(" b %d\n", b);

	testF();
	testF();
	b++;
	printf(" b %d\n", b);

	return 0;
}

