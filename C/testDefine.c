#include <stdio.h>

#define message(a,b)\
	printf(#a  "and" # b":i love u \n")
	
#define token(n)	printf("token"#n"=%d",token##n)

#define aaddb(a,b)  (a+b)

int main(int argc, char *argv[]) {
	message(wang ,leyi);
	int token22= 42;
	token(22);
	printf("\n=%d",aaddb(2,3));
	return 0;
}