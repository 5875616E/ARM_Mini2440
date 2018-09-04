# đường dẫn đến toolchain
TOOLCHAIN := /home/lien/Desktop/xuanvt/mini2440-20100315/linux/usr/local/arm/4.3.2/bin
# đường dẫn đến thư mục chưa kernel
KDIR := /home/lien/Desktop/xuanvt/mini2440-20100315/linux/linux-2.6.32.2
PWD := $(shell pwd)
PATH := $(TOOLCHAIN):${PATH}

obj-m += mini2440_adc.o

default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

clean:
	@rm -Rf *.o *.ko *.mod.c modules.order Module.symvers
