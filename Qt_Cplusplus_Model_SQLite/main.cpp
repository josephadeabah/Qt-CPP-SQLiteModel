#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSqlTableModel>
#include "DatabaseManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    DatabaseManager dbManager;
    if (!dbManager.connectToDatabase("peoples.db")) {
        qDebug() << "Failed to connect to database!";
        return -1;
    }

    CustomSqlQueryModel *model = dbManager.getQueryModel("SELECT ids, name, profession FROM people");
    if (!model) {
        qDebug() << "Failed to retrieve data model!";
        return -1;
    }

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("sqlModel", model);
    engine.loadFromModule("Qt_Cplusplus_Model_SQLite", "Main");

    return app.exec();
}
