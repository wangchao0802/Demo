#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	char name[100];
	char *desc;
	strcpy(name ,"zalljlejlwg");
	
	desc = malloc(200*sizeof(char));
	
	if (desc == NULL){}
	else {
		strcpy(desc,"fuckkdkfjeijgljelwe;w");
	}
	
	printf("name = %s\n",name);
	printf("desc = %s\n",desc);

	desc = realloc(desc,100*sizeof(char));
	
	printf("desc = %s\n",desc);

	free(desc);
	
	
	
	
}