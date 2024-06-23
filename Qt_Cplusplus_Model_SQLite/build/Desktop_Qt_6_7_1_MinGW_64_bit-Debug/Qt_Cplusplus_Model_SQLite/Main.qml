import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.qmlmodels 1.15

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
            Rectangle {
                color: "teal"
                anchors.fill: parent

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10
                    anchors.margins: 10

                    ListView {
                        width: parent.width
                        height: parent.height
                        clip: true
                        model: sqlModel
                        spacing: 5

                        delegate: Rectangle {
                            width: ListView.view.width - 20
                            height: 60
                            color: index % 2 === 0 ? "#ffffff" : "#e0e0e0"
                            border.color: "#d0d0d0"
                            border.width: 1
                            radius: 5
                            Layout.fillWidth: true

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 10

                                Text {
                                    text: model.ids
                                    font.pixelSize: 20
                                    color: "#333333"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                Text {
                                    text: model.name
                                    font.pixelSize: 20
                                    color: "#333333"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                Text {
                                    text: model.profession
                                    font.pixelSize: 20
                                    color: "#333333"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
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
