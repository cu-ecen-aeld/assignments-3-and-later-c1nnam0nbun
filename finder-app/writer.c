#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char** argv) {
	openlog(NULL, 0, LOG_USER);
	if (argc < 3) {
		syslog(LOG_ERR, "Invalid number of arguments. \nUsage: writer <file> <string>\n");
	        closelog();
		return 1;
	}
	FILE *file = fopen(argv[1], "w");
	
	syslog(LOG_DEBUG, "Writing '%s' to '%s'\n", argv[2], argv[1]);
	fprintf(file, "%s\n", argv[2]);

	fclose(file);
	closelog();

        return 0;
}
