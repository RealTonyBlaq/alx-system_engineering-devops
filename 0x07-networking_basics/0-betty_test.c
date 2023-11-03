#include <stdio.h>
#include <unistd.h>

/**
 * main - print string literal.
 * Return: 0 (success)
 */

int main(void)
{
	char *str;

	str = "Hello! World";
	write(STDOUT_FILENO, str, 12);
	write(STDOUT_FILENO, "\n", 1);

	return (0);
}
