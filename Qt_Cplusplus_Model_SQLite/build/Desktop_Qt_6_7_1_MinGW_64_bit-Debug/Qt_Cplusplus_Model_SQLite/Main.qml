import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "App"

    footer: TabBar {
        id: bar
        onCurrentIndexChanged: stackLayout.currentIndex = currentIndex
        TabButton {
            text: qsTr("Home")
        }
        TabButton {
            text: qsTr("Discover")
        }
        TabButton {
            text: qsTr("Activity")
        }
    }

    StackLayout {
        id: stackLayout
        width: parent.width
        height: parent.height
        currentIndex: bar.currentIndex

        Item {
            id: homeTab
            GridView {
                id: gridView
                anchors.fill: parent
                model: sqlModel
                cellWidth: parent.width / 3
                cellHeight: 50

                delegate: Item {
                    width: gridView.cellWidth
                    height: gridView.cellHeight

                    Rectangle {
                        width: parent.width
                        height: parent.height
                        color: index % 3 === 0 || (index - 1) % 3 === 0 || (index - 2) % 3 === 0 ? (index / 3) % 2 === 0 ? "#ffffff" : "#e0e0e0" : "transparent"
                        border.color: "#d0d0d0"
                        border.width: 1

                        Text {
                            anchors.centerIn: parent
                            text: {
                                if (index % 3 === 0) {
                                    return model.ids
                                } else if (index % 3 === 1) {
                                    return model.name
                                } else {
                                    return model.profession
                                }
                            }
                            font.pixelSize: 20
                            color: "#333333"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }

        Item {
            id: discoverTab
            Rectangle {
                color: "orange"
                anchors.fill: parent
                Text {
                    anchors.centerIn: parent
                    text: "Discover Tab"
                    font.pixelSize: 30
                    color: "white"
                }
            }
        }

        Item {
            id: activityTab
            Rectangle {
                color: "plum"
                anchors.fill: parent
                Text {
                    anchors.centerIn: parent
                    text: "Activity Tab"
                    font.pixelSize: 30
                    color: "white"
                }
            }
        }
    }
}
