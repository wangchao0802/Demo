#include <stdio.h>

int count;

extern void write_extern();

 int main(int argc, char const *argv[])
{
	/* code */
	count =12;
	write_extern();
	printf("%d\n", 8>7?:2);
	return 0;
}
