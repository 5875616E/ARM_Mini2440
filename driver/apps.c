#include <stdio.h>

int main(void)
{
	int fd;
	char buffer[30];
	fd = open("/dev/mini2440_adc", 0); // read ADC channel 1
	if (fd < 0) {
		printf("open ADC device:");
	}
	int len = read(fd, buffer, sizeof buffer -1);
	if (len > 0) {
		buffer[len] = '\0';
		int value = -1;
		sscanf(buffer, "%d", &value);
		printf("ADC Value: %d\n", value);
	} else {
		printf("read ADC device:");
	}
	return 0;
}
