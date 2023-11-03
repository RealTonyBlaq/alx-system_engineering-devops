#include "shell.h"

/**
 * _strchr -  a function that locates a character in a string.
 * @s: input
 * @c: input
 * Return: NULL
 */

char *_strchr(char *s, char c)
{
	int i;

	for (i = 0; s[i] >= '\0'; i++)
	{
		if (s[i] == c)
			return (s + i);
	}
	return (NULL);
}

/**
 * _strstr - Function locates a substring
 * @haystack: String to be checked
 * @needle: Second string
 * Return: Always 0 or "NULL" if otherwise.
 */

char *_strstr(char *haystack, char *needle)
{
	char *str1, *str2;

	while (*haystack != '\0')
	{
		str1 = haystack;
		str2 = needle;
		while (*haystack != '\0' && *str2 != '\0' && *haystack == *str2)
		{
			haystack++;
			str2++;
		}
		if (*str2 == '\0')
			return (str1);
		haystack = str1 + 1;
	}
	return (NULL);
}
/**
 * _strncmp - a function that compare two strings
 * @s1: first string
 * @s2: second string
 * @n: n byte of s1 and s2
 * Return: an integer value
 */
int _strncmp(char *s1, char *s2, size_t n)
{
	size_t i;

	for (i = 0; i < n; ++i)
	{
		if (s1[i] != s2[i])
		{
			return ((unsigned char)s1[i] - (unsigned char)s2[i]);
		}
		if (s1[i] == '\0')
		{
			break;
		}
	}
	return (0);
}

/**
 * free_tokens - Function frees tokenized strings
 * @token_array: Array of tokens to be freed
 *
 * Return: Nothing
 */

void free_tokens(char **token_array)
{
	int i;

	for (i = 0; token_array[i] != NULL; i++)
		free(token_array[i]);
	free(token_array);
}

/**
 * exit_status - Returns an exit status
 * @token_array: Tokenized strings
 *
 * Return: The status, 0 if token_array is NULL
 */

int exit_status(char **token_array)
{
	int status = errno;

	if (token_array[1] == NULL)
		return (errno);
	status = atoi(token_array[1]);
	if (status < 0)
		status = 2;
	return (status);
}
