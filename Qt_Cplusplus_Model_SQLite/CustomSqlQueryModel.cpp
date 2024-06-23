#include "CustomSqlQueryModel.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

CustomSqlQueryModel::CustomSqlQueryModel(QObject *parent) : QSqlQueryModel(parent) {}

QVariant CustomSqlQueryModel::data(const QModelIndex &index, int role) const {
    if (role < Qt::UserRole) {
        return QSqlQueryModel::data(index, role);
    } else {
        int columnIdx = role - Qt::UserRole;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
}

QHash<int, QByteArray> CustomSqlQueryModel::roleNames() const {
    QHash<int, QByteArray> roles;
    for (int i = 0; i < this->columnCount(); i++) {
        roles[Qt::UserRole + i] = this->headerData(i, Qt::Horizontal).toByteArray();
    }
    return roles;
}

bool CustomSqlQueryModel::setData(const QModelIndex &index, const QVariant &value, int role) {
    if (role == Qt::EditRole) {
        int column = index.column();
        QString columnName = this->headerData(column, Qt::Horizontal).toString();
        int row = index.row();
        QString id = this->data(this->index(row, 0)).toString();

        QSqlQuery query;
        query.prepare(QString("UPDATE people SET %1 = :value WHERE ids = :id").arg(columnName));
        query.bindValue(":value", value);
        query.bindValue(":id", id);

        if (!query.exec()) {
            qDebug() << "Error: Failed to update database -" << query.lastError().text();
            return false;
        }

        QSqlQueryModel::setData(index, value, role);
        emit dataChanged(index, index, {role});
        return true;
    }
    return false;
}

Qt::ItemFlags CustomSqlQueryModel::flags(const QModelIndex &index) const {
    return QSqlQueryModel::flags(index) | Qt::ItemIsEditable;
}
