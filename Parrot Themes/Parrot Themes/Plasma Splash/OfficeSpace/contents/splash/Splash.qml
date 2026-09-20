/*
 *   Copyright 2026 UAgain Shadow <UAgain Shadow>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 3+,
 *   or (at your option) any later version.
 */

import QtQuick 2.15
import QtQuick.Window 2.15
import org.kde.kirigami 2 as Kirigami

Rectangle {
    id: root
    color: "#000000"
    
    property int stage: 0
    
    Item {
        id: content
        anchors.fill: parent
        opacity: 1.0
        
        TextMetrics {
            id: units
            text: "M"
            
            property int gridUnit: boundingRect.height
            property int largeSpacing: gridUnit
            property int smallSpacing: Math.max(2, gridUnit / 4)
        }
        
        /*
         * GIF
         */
        AnimatedImage {
            id: face
            
            anchors.fill: parent
            
            source: "images/OfficeSpace.gif"
            
            playing: true
            visible: true
            
            fillMode: Image.PreserveAspectFit
            
            smooth: true
            
            onStatusChanged: {
                console.log("OfficeSpace.gif status:", status)
            }
            
            onFrameChanged: {
                console.log("OfficeSpace.gif frame:", currentFrame)
            }
        }
        
        /*
         * Plasma logo
         */
        Image {
            id: plasmaLogo
            
            y: 150
            
            anchors.horizontalCenter: parent.horizontalCenter
            
            anchors.margins: units.gridUnit
            
            source: "images/plasma.svgz"
            
            sourceSize.height: units.gridUnit * 3
            sourceSize.width: units.gridUnit * 3
            
            smooth: true
        }
        
        /*
         * Welcome text
         */
        Row {
            opacity: 0.5
            
            spacing: units.smallSpacing * 2
            
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                margins: units.gridUnit
            }
            
            Text {
                color: "#7eb761"
                
                renderType: Screen.devicePixelRatio % 1 !== 0
                ? Text.QtRendering
                : Text.NativeRendering
                
                anchors.verticalCenter: parent.verticalCenter
                
                text: "Welcome to Plasma"
            }
            
            Image {
                source: "images/kde.svgz"
                
                sourceSize.height: units.gridUnit * 2
                sourceSize.width: units.gridUnit * 2
                
                smooth: true
            }
        }
    }
}
