#include <stdio.h>
struct
{
	unsigned int withV;
	unsigned int heightV;
} status1;

struct 
{
	unsigned int wV:1;
	unsigned int hV:1;
} status2;

struct 
{
	unsigned int age:3;
} Age;


int main(int argc, char *argv[]) {
	
	printf("menory occ st1: %d\n",sizeof(status1));
	printf("menory occ st2: %d\n",sizeof(status2));
	
	Age.age = 4;
	printf("age  %d\n",Age.age);

	Age.age = 7;
	printf("age  %d\n",Age.age);
	Age.age = 8;
	printf("age  %d\n",Age.age);

	printf("DATE  %s\n",__DATE__);
	printf("DATE  %s\n",__TIME__);
	printf("DATE  %s\n",__FILE__);
	printf("DATE  %d\n",__LINE__);
	printf("DATE  %d\n",__STDC__);

	return 0;
}