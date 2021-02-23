#include <stdio.h>

to_upper(char*);
const int LEN = 10;
char str[] = { 'A', '`', 'C', 'd', 'e', 'f', 'g', 'h', 'z', '}', '\0' };

int main()
{
	to_upper(str);
	for (int i = 0; i < LEN; ++i) {
		printf("%c\n", str[i]);
	}

    return 0;
}