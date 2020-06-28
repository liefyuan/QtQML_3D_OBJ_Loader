#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFileDialog>
#include <QMessageBox>
#include <QDebug>

#include <Qt3DQuickExtras/qt3dquickwindow.h>
#include <Qt3DQuick/QQmlAspectEngine>

#include <QQmlContext>
#include <QQmlEngine>

#include <QtQuickWidgets/QQuickWidget>


namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void init3DModel();

    void update3DModelAngle(int x, int y,int z);

    void on_verticalSlider_actionTriggered(int action);

    void on_verticalSlider_2_actionTriggered(int action);

    void on_verticalSlider_3_actionTriggered(int action);

private:
    Ui::MainWindow *ui;

    QString        g_xAngle;
    QString        g_yAngle;
    QString        g_zAngle;
};

#endif // MAINWINDOW_H
