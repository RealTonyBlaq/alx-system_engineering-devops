#include "shell.h"

/**
 * read_line - Reads chars from stdin using getline
 *
 * Return: A pointer to an array string.
 */

char *read_line(void)
{
	char *getline_buffer = NULL, *str = NULL;
	size_t getline_buffer_size = 0;
	ssize_t num_of_char_read;

	num_of_char_read = getline(&getline_buffer, &getline_buffer_size, stdin);
	/*handle ctrl+D*/
	if (num_of_char_read == -1)
	{
		free(getline_buffer);
		return (NULL);
	}
	/*check if getline function store the command read from stdin*/
	if (getline_buffer == NULL)
	{
		perror("Unable to read command");
		exit(errno);
	}
	if (getline_buffer[0] == '\n' || getline_buffer[0] == ' ')
	{
		if (getline_buffer[0] == ' ')
		{
			str = check_spaces(getline_buffer);
			free(getline_buffer);
		}
		else
		{
			free(getline_buffer);
			continue;
		}
		if (getline_buffer == NULL)
		{
			free(getline_buffer);
			continue;
		}
	}
	return (getline_buffer);
}
