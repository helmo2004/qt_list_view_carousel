import QtQuick 2.0
import QtQuick.Controls 1.0

ApplicationWindow {
    id: window
    visible: true;
    width: 1300;
    height: 400;

    ListView {
        id: listView
        anchors.fill: parent;
        orientation: ListView.Horizontal;

        // This highlight is always in the middle
        highlightRangeMode : ListView.StrictlyEnforceRange
        preferredHighlightBegin : (parent.width - 400) / 2
        preferredHighlightEnd : preferredHighlightBegin + 400
        highlightMoveDuration : 200

        // Flickable Config
        boundsBehavior: Flickable.StopAtBounds

        delegate:
            Item {
                width: 400;
                height: 400;
                Image {
                    id: name
                    source: "cup.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    height: listView.currentIndex === index ? parent.height : parent.height * 0.85;
                    Behavior on height { NumberAnimation { duration: 200 }}
                    width: listView.currentIndex === index ? parent.width : parent.width * 0.85;
                    Behavior on width { NumberAnimation { duration: 200 }}
                    anchors.bottomMargin: listView.currentIndex === index ? 0 : 10;
                    Behavior on anchors.bottomMargin { NumberAnimation { duration: 200 }}
                    MouseArea {
                      z: 1
                      hoverEnabled: false
                      anchors.fill: parent
                      onClicked: listView.currentIndex = index
                    }
            }
        }

        onCurrentItemChanged : {
            window.title = "Selected Item: " + currentIndex
        }

        model: ListModel {
            ListElement {}
            ListElement {}
            ListElement {}
            ListElement {}
            ListElement {}
            ListElement {}
            ListElement {}
        }
    }
}
