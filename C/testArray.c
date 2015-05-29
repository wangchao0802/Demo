#include <stdio.h>

int  main(int argc, char const *argv[])
{
	int n[10] = {29,24,2};
	for (int i = 0; i < 10; ++i)
	{
		/* code */
		printf("%d\n", n[i]);
	}

	int var =20;
	int *ip = &var;

	printf("%x\n", ip);
	printf("%d \n", *ip);






	return 0;
}