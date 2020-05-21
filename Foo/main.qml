import QtQuick 2.0
import QtQuick.Controls 1.0

ApplicationWindow {
    id: window
    visible: true;
    width: 1600;
    height: 400;

    title: "Selected Item: " + listView.currentIndex + "; currentIndexFloat: " + listView.currentIndexFloat

    ListView {
        id: listView
        anchors.fill: parent;
        orientation: ListView.Horizontal;

        Keys.onPressed: {
            var index = event.key - Qt.Key_0
            if (index >= 0 && index < listView.count) {
                listView.currentIndex = index;
                event.accepted = true;
            }
        }

        focus: true

        // This highlight is always in the middle
        highlightRangeMode : ListView.StrictlyEnforceRange
        preferredHighlightBegin : (parent.width - itemWidth) / 2
        preferredHighlightEnd : preferredHighlightBegin + itemWidth
        highlightMoveDuration : 200

        property int itemWidth: 400
        property int itemHeigth: 400
        property real currentIndexFloat: (listView.contentX + preferredHighlightBegin) / itemWidth

        // Flickable Config
        boundsBehavior: Flickable.StopAtBounds

        delegate:
            Item {
                width: listView.itemWidth;
                height: listView.itemHeigth;
                Image {
                    source: "cup.svg"

                    // Calculate Transformation
                    property real realtivePositionFloat: listView.currentIndexFloat - index
                    property real saturatedFocusOffset: Math.max(-1, Math.min(1, realtivePositionFloat))
                    property real scaleFactor: 1 - (0.3 * Math.abs(saturatedFocusOffset))
                    property real xOffset: -(saturatedFocusOffset * 80);

                    // apply Transformation
                    anchors.horizontalCenterOffset: xOffset
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: parent.height * scaleFactor;
                    width: parent.width * scaleFactor;
                }
                MouseArea {
                  z: 1
                  hoverEnabled: false
                  anchors.fill: parent
                  onClicked: listView.currentIndex = index
                }
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
