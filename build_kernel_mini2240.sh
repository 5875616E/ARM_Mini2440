export PATH=$PATH:/home/lien/Desktop/xuanvt/mini2440-20100315/linux/usr/local/arm/4.3.2/bin
sudo make ARCH=arm  distclean
make ARCH=arm mrproper
make ARCH=arm mini2440_defconfig
cp config_mini2440_n35 .config
make ARCH=arm menuconfig
make ARCH=arm -j4
make ARCH=arm -j4 uImage
make ARCH=arm -j4 modules
make ARCH=arm -j4 all
ls arch/arm/boot/
