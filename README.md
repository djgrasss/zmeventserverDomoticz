**Forked Version: 1.1**

## What is it?
A WSS (Secure Web Sockets) and/or MQTT  based event notification server that broadcasts new events to any authenticated listeners.
(As of 0.6, it also includes a non secure websocket option, if that's how you want to run it). Check out the original source [here](https://github.com/pliablepixels/zmeventserver)!

## What is diffrent?
With this fork, you can activate a virtual device in Domoticz by an alarm in Zoneminder, such as a motion detector.
Currently, only activation a virtual device is supported by an alert in Zoneminder. This has the consequence that the motion detector always remains "ON" in Domoticz. Add a "Off Delay" in Domoticz device settings is a possible workaround.
zmeventserverDomoticz will send a MQTT message with topic "domoticz/in".

## How to configure?
Create a virtual device in Domoticz named `Camera Motion Dummy` and remember the Idx number.
Add the Idx number in the last section of `zmeventnotification.ini` file.
Create a new dzVents Device script in Domoticz named `CameraMotion` and copy and paste the [raw](https://raw.githubusercontent.com/jannnfe/zmeventserverDomoticz/master/cameramotion.lua) script from this repository.
See the Notes in the Script and edit the script if necessary!

## How do I install it?
Follow the instructions on the original source [here](https://github.com/pliablepixels/zmeventserver#06-how-do-i-install-it) and use this files instead:
* [Download `zmeventnotification.pl`](https://raw.githubusercontent.com/jannnfe/zmeventserverDomoticz/master/zmeventnotification.pl)
* [Download `zmeventnotification.ini`](https://raw.githubusercontent.com/jannnfe/zmeventserverDomoticz/master/zmeventnotification.ini)

## To-Do
Add support for disable events after alarm is over.