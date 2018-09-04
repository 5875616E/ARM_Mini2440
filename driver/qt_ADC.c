#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    fd = open("/dev/mini2440_adc", 0); // read ADC channel 1
    if (fd < 0) {
        qDebug("open ADC device:");
    }
    connect(&timer,SIGNAL(timeout()),this,SLOT(readADC()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::readADC()
{
    char buffer[30];
    int len = read(fd, buffer, sizeof buffer -1);
    if (len > 0) {
        buffer[len] = '\0';
        int value = -1;
        sscanf(buffer, "%d", &value);
        qDebug("ADC Value: %d\n", value);
        ui->label_adc->setText(QString::number(value));
    } else {
        qDebug("read ADC device:");
    }
}

void MainWindow::on_pushButton_clicked()
{
    timer.start(1000);
}
