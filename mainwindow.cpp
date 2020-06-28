#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    init3DModel();
}

MainWindow::~MainWindow()
{
    delete ui;
}


// 初始化模型
void MainWindow::init3DModel()
{
    ui->quickWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    ui->quickWidget->setSource(QUrl("qrc:/main.qml"));
}

// 发送信息给3D模型
void MainWindow::update3DModelAngle(int x, int y,int z)
{
    QMetaObject::invokeMethod((QObject *)ui->quickWidget->rootObject(),
                              "updateAngle",
                              Q_ARG(QVariant, QVariant(x)),
                              Q_ARG(QVariant, QVariant(y)),
                              Q_ARG(QVariant, QVariant(z)));
}


void MainWindow::on_verticalSlider_actionTriggered(int action)
{
    update3DModelAngle(ui->verticalSlider->value(),
                       ui->verticalSlider_2->value(),
                       ui->verticalSlider_3->value());
}

void MainWindow::on_verticalSlider_2_actionTriggered(int action)
{
    update3DModelAngle(ui->verticalSlider->value(),
                       ui->verticalSlider_2->value(),
                       ui->verticalSlider_3->value());
}

void MainWindow::on_verticalSlider_3_actionTriggered(int action)
{
    update3DModelAngle(ui->verticalSlider->value(),
                       ui->verticalSlider_2->value(),
                       ui->verticalSlider_3->value());
}
