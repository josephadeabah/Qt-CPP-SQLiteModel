#include "CustomSqlQueryModel.h"

CustomSqlQueryModel::CustomSqlQueryModel(QObject *parent)
    : QSqlQueryModel(parent)
{
}

QVariant CustomSqlQueryModel::data(const QModelIndex &index, int role) const
{
    if (role < Qt::UserRole) {
        return QSqlQueryModel::data(index, role);
    } else {
        int columnIdx = role - Qt::UserRole;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
}

QHash<int, QByteArray> CustomSqlQueryModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    for (int i = 0; i < this->columnCount(); i++) {
        roles[Qt::UserRole + i] = this->headerData(i, Qt::Horizontal).toByteArray();
    }
    return roles;
}
