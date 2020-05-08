#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <err.h>

static int rmdirp __P((char *));
static void usage __P((void));

int main(argc, argv)
	int argc;
	char **argv;{
	int errors;
	int ch;
	int delete_parent = 0;

	while ((ch = getopt (argc, argv, "p")) != -1) {
		switch (ch) {
		case 'p':
			delete_parent = 1;
			break;
		case '?':
		default:
			usage();
		}
	}

	if (!*(argv += optind)) {
		usage ();
	}

	for (errors = 0; *argv; argv++) {
		if (!delete_parent) {
			if (rmdir(*argv)) {
				warn ("failed to remove ‘%s’", *argv);
				errors = 1;
			}
		} else {
			if (rmdirp(*argv)) {
				errors = 1;
			}
		}
	}
	exit(errors);
}
static int rmdirp (path)
	char *path; {
	char *slash;

	if (rmdir (path)) {
		warn ("%s", path);
		return -1;
	}
	for (;;) {
		slash = strrchr (path, '/');
		if (slash == NULL) {
			return 0;
		}
		/* skip trailing slash characters */
		while (slash > path && *slash == '/')
			slash--;
		if (*slash == '/')      /* don't attempt to remove root */
			return 0;
		*++slash = '\0';

		if (rmdir (path)) {
			warn ("%s", path);
			return -1;
		}
	}
}
static void usage(){
	exit(1);
}
