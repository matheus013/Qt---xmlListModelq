import QtQuick 2.5
import QtQuick.XmlListModel 2.0
import QtQuick.Controls 1.4
import QtQuick.Window 2.0
Window{
    function mm(value){
        return value*Screen.pixelDensity
    }
    visible: true
    height: mm(120)
    width: mm(80)
    XmlListModel {
        id: xmlModel
        source: "data.xml"
        query: "/contacts/item"
        XmlRole {
            name: "name"
            query: "name/string()"
        }
        XmlRole {
            name: "number"
            query: "number/string()"
        }
    }
    ListView{

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        model: xmlModel
        focus: true
        delegate: Text {
            text: name + ": " + number
        }
        highlight:Rectangle{
            color: "lightblue"
            radius: 5
        }
    }
}
