import QtQuick 2.15
import QtQuick.Window 2.15
import Login 1.0
import QtQuick.Controls 2.15
Window {
    id:   mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    QtObject{
        id:   globals

        property int height   : mainWindow.height
        property int width    : mainWindow.width
        property int pixelSize: 1
    }
    Login{
        id: login
    }

    Rectangle {
        id:                        _root
        height:                    parent.height * 0.9
        width:                     parent.width
        color:                     "#DCDCDC"
        radius:                    height /35

        Label{
            id:                           errormsg
            anchors.top:                  userloginContainer.top
            anchors.topMargin:            -(userloginContainer.height * 0.1)
            text:                         "Wrong UserName/Password"
            visible:                      false
            anchors.horizontalCenter:     parent.horizontalCenter
        }

        Rectangle{
            id:                       userloginContainer
            height:                   parent.height * 0.45
            width:                    parent.width * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom:           parent.bottom
            anchors.bottomMargin:     parent.height * 0.05
            radius:                    height /30

            Column{
                anchors.top:                 parent.top
                anchors.margins:             parent.height * 0.09
                spacing:                     parent.height * 0.025
                anchors.horizontalCenter:    parent.horizontalCenter
                Column{
                    spacing:               parent.height * 0.03
                    anchors.horizontalCenter:  parent.horizontalCenter
                    Text{
                        text:            "Username :"
                        color:           "grey"
                        font.pixelSize:  globals.pixelSize * 15
                    }
                    TextField{
                        id:                username
                        placeholderText:   "Enter"
                        anchors.horizontalCenter:  parent.horizontalCenter
                        height:             userloginContainer.height * 0.15
                        width:              userloginContainer.width  * 0.7
                        color:              "grey"
                        background: Rectangle {
                            border.color:       "grey"
                            color:              "transparent"
                            anchors.fill:        parent
                            radius:              height / 10
                        }
                    }
                }
                Column{
                    spacing:                   parent.height * 0.03
                    anchors.horizontalCenter:  parent.horizontalCenter
                    Text{
                        text:            "Password :"
                        color:           "grey"
                        font.pixelSize:  globals.pixelSize * 15
                    }
                    TextField{
                        id:              pass
                        placeholderText:  "Enter"
                        anchors.horizontalCenter:  parent.horizontalCenter
                        height:             userloginContainer.height * 0.15
                        width:              userloginContainer.width  * 0.7
                        color:              "grey"
                        background: Rectangle {
                            border.color:       "grey"
                            color:              "transparent"
                            anchors.fill:       parent
                            radius:             height / 8
                        }
                    }
                }

                Rectangle{
                    height:                   userloginContainer.height * 0.15
                    width:                    userloginContainer.width * 0.3
                    radius:                   height/15
                    anchors.horizontalCenter: parent.horizontalCenter
                    color:                   "#0C8CE9"
                    Text{
                        anchors.centerIn:  parent
                        text:              "Login"
                        color:             "white"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            errormsg.visible  = false
                            if(username.text!=""&&pass.text!=""){
                              if(login.authenticate(username.text,pass.text)){
                                  console.log("successfull login")
                              }else{
                                  errormsg.visible  = true
                              }
                            }
                            username.clear()
                            pass.clear()
                        }
                    }
                }
                Text{
                    text:                     "Forgot Password? Contact Admin"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.underline:           true
                    color:       "grey"
                }
            }
        }

    }

}
