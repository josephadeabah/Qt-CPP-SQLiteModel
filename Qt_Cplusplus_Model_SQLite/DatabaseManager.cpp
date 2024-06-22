#include "DatabaseManager.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

DatabaseManager::DatabaseManager(QObject *parent) : QObject(parent) {}

bool DatabaseManager::connectToDatabase(const QString &dbName) {
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(dbName);

    if (!db.open()) {
        qDebug() << "Error: Could not open database.";
        return false;
    }

    return true;
}

CustomSqlQueryModel* DatabaseManager::getQueryModel(const QString &queryStr) {
    CustomSqlQueryModel *model = new CustomSqlQueryModel;
    model->setQuery(queryStr);

    if (model->lastError().isValid()) {
        qDebug() << "Error: Failed to execute query -" << model->lastError().text();
        delete model;
        return nullptr;
    }

    model->setHeaderData(0, Qt::Horizontal, "ids");
    model->setHeaderData(1, Qt::Horizontal, "name");

    return model;
}
