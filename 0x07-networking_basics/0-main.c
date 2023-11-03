#include "shell.h"

/**
 * main - Entry point
 * @ac: Argument count
 * @token_array: Array of tokens
 * @environ: The global variable
 *
 * Return: 0 (success)
 */

int main(int ac, char **token_array, char **environ)
{
	int isatty_mode = 0, status;
	char *getline_buffer = NULL, *buffer = NULL;
	(void)ac;

	isatty_mode = isatty(STDIN_FILENO);
	while (1)
	{
		if (isatty_mode == 1)
			write(STDOUT_FILENO, "$ ", 2);
		getline_buffer = read_line();
		if (getline_buffer == NULL)
		{
			if (isatty_mode == 1)
				write(STDOUT_FILENO, "\n", 1);
			break;
		}
		if (getline_buffer[0] == '\n' || getline_buffer[0] == ' ')
		{
			if (getline_buffer[0] == ' ')
				getline_buffer = check_spaces(getline_buffer);
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
		buffer = duplicate(getline_buffer);
		token_array = tokenize(getline_buffer, buffer, NULL);
		if ((_strcmp(token_array[0], "exit") == 0))
		{
			status = exit_status(token_array);
			free(buffer);
			free(getline_buffer);
			free_tokens(token_array);
			exit(status);
		}
		exec_func(token_array, environ);
		free_tokens(token_array);
		free(buffer);
		free(getline_buffer);
	}
	return (0);
}
