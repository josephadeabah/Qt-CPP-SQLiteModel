import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "SQLite Data Viewer"

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#f0f0f0"

        ListView {
            width: parent.width
            height: parent.height
            clip: true
            model: sqlModel
            spacing: 5
            anchors.margins: 10

            delegate: Rectangle {
                width: ListView.view.width - 20
                height: 60
                color: index % 2 === 0 ? "#ffffff" : "#e0e0e0"
                border.color: "#d0d0d0"
                border.width: 1
                radius: 5

                RowLayout {
                    spacing: 10
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 10

                    Text {
                        text: model.ids
                        width: 50
                        color: "#333333"
                        font.pixelSize: 20
                        verticalAlignment: Text.AlignVCenter
                    }

                    Text {
                        text: model.name
                        width: 200
                        color: "#333333"
                        font.pixelSize: 20
                        verticalAlignment: Text.AlignVCenter
                    }

                    Text {
                        text: model.profession
                        width: 200
                        color: "#333333"
                        font.pixelSize: 20
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}
