#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "myclass.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    MyClass myClass;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("myClass", &myClass);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;


    return app.exec();
}
