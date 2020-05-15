import QtQuick 2.0
import QtQuick.Controls 1.0

ApplicationWindow {
    id: window
    visible: true;
    width: 1300;
    height: 300;

    ListView {
        id: listView
        anchors.fill: parent;
        orientation: ListView.Horizontal;

        // This highlight is always in the middle
        highlightRangeMode : ListView.StrictlyEnforceRange
        preferredHighlightBegin : (parent.width - 400) / 2
        preferredHighlightEnd : preferredHighlightBegin + 400
        highlightMoveDuration : 200

        delegate: Image {
            id: name
            source: "cup.svg"

            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            width: 400;
            height: ListView.view.currentIndex === index ? parent.height : parent.height * 0.7;
            Behavior on height { NumberAnimation { duration: 200 }}
            property string str: bgcolor
            MouseArea {
              z: 1
              hoverEnabled: false
              anchors.fill: parent
              onClicked: listView.currentIndex = index
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
