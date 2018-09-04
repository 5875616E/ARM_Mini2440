git clone https://github.com/kergoth/tslib

cd tslib
#even though we are checking out 1.0, the build actually generates libts-0.0.so.0!
git checkout 1.0
git checkout -b 1.0
./autogen.sh
./configure --host=arm-linux --prefix=/usr/local/tslib --enable-static --enable-shared

#Open config.h and comment out the following:
#	#define malloc rpl_malloc
#	to
#	//#define malloc rpl_malloc

make
sudo make install

sudo cp -r /usr/local/tslib/ /opt/

#http://ftp.jaist.ac.jp/pub/qtproject/archive/qt/4.7/qt-everywhere-opensource-src-4.7.2.tar.gz

cd qt-everywhere-opensource-src-4.7.2

#Sửa file cấu hình biên dịch qmake.conf chứa tại $HOME/qt-everywhere-opensource-src-4.7.2/mkspecs/qws/linux-arm-g++/qmake.conf

./configure --prefix=/opt/qte -embedded arm -xplatform qws/linux-arm-g++ -qt-mouse-tslib -little-endian -no-qt3support -fast -no-largefile -qt-sql-sqlite -nomake tools -nomake demos -nomake examples -no-webkit -no-multimedia -no-javascript-jit

sudo apt-get install zlib1g-dev
make
sudo make install

#install qt-sdk-linux-x86_64-opensource-2010.05.1.bin

#Bước 1. Chọn tab Project, mở giao diện Build Settings tương ứng Project đang cấu hình.Trên cửa sổ này, mở mục Manage

#Bước 2.Click nút Add (+) để thêm mới một nền tảng biên dịch chéo.

#Tạo 1 cấu hình biên dịch mới, đặt tên Mini2440, trỏ tới Qmake đã cài đặt ở phần trước (nằm trong /opt/qte/bin/qmake)

#Bước 3. Biên dịch ứng dụng với cấu hình biên dịch đã thiết lập ở trên.


