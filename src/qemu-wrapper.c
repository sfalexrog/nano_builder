#include <unistd.h>
#include <string.h>

int main(int argc, char **argv, char **env)
{
	char *newargv[argc+3];
	newargv[0] = argv[0];
	newargv[1] = "-cpu";
	newargv[2] = "cortex-a57";

	memcpy(&newargv[3], &argv[1], sizeof(*argv) * (argc - 1));
	newargv[argc + 2] = NULL;
	return execve("/usr/bin/qemu-aarch64-static", newargv, env);
}

