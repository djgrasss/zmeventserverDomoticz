**Forked Version: 1.1**

## What is it?
A WSS (Secure Web Sockets) and/or MQTT  based event notification server that broadcasts new events to any authenticated listeners.
(As of 0.6, it also includes a non secure websocket option, if that's how you want to run it). Check out the original source [here](https://github.com/pliablepixels/zmeventserver)!

## What is diffrent?
With this fork, you can activate a virtual device in Domoticz by an alarm in Zoneminder, such as a motion detector.
Currently, only activation a virtual device is supported by an alert in Zoneminder. This has the consequence that the motion detector always remains "ON" in Domoticz. Add a "Off Delay" in Domoticz device settings is a possible workaround.
zmeventserverDomoticz will send a MQTT message with topic "domoticz/in".

## How to configure?
create a virtual device in domoticz and remember the Idx number. Name your monitor in Zoneminder according to the following scheme:
`-Idx- Monitorname` example: `-12- Camera Garage`

## How do I install it?
Follow the instructions on the original source [here](https://github.com/pliablepixels/zmeventserver#06-how-do-i-install-it) and use this files instead:
* [Download `zmeventnotification.pl`](https://raw.githubusercontent.com/jannnfe/zmeventserverDomoticz/master/zmeventnotification.ini)
* [Download `zmeventnotification.ini`](https://raw.githubusercontent.com/jannnfe/zmeventserverDomoticz/master/zmeventnotification.ini)