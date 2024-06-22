#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include "CustomSqlQueryModel.h"  // Include the custom model header

class DatabaseManager : public QObject
{
    Q_OBJECT
public:
    explicit DatabaseManager(QObject *parent = nullptr);
    bool connectToDatabase(const QString &dbName);
    CustomSqlQueryModel* getQueryModel(const QString &queryStr);

private:
    QSqlDatabase db;
};

#endif // DATABASEMANAGER_H
