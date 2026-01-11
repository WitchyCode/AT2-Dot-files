import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick

/* Colors
#020909
#232446
#212640
#112b54
#203959
#303a47
#5c78a8
#72aff3
#0b2629
#2b2d57
#292f50
#153569
#28476f
#3c4858
#7396d2
#99eaff
*/

PanelWindow {
  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 15
  color: "#B33c4858"

  Row {
    anchors.centerIn: parent
    spacing: 10
    Repeater {
      model: Hyprland.workspaces
      delegate: Text {
        text: modelData.name
        font.bold: modelData.active
        font.family: "IosevkaTerm Nerd Font"

        // Highlight the active one
        color: modelData.active ? "purple" : "white"

        MouseArea {
          anchors.fill: parent
          onClicked: Hyprland.dispatch("workspace " + modelData.id)
        }
      }
    }
  }

  /*Text{
    property var workspace: Hyprland.workspaces.name
    anchors.centerIn: parent
    text: workspace //"I love you baby!"
    color: "#FFFFFF"
  }
  */

  Text {
    id: clockText
    text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm:ss")
    color: "white"
    font.bold: true
    font.family: "IosevkaTerm Nerd Font"
    leftPadding: 5
    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: clockText.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm:ss")
    }
  }

  Row {

  }

}
