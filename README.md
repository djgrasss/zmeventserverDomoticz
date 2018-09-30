**Forked Version: 1.1**

<<<<<<< HEAD
## What is it?
=======
**Latest Version: 1.3**

<!-- TOC -->

- [0.1. Breaking Changes](#01-breaking-changes)
    - [0.1.1. Breaking changes - version 1.0 onwards](#011-breaking-changes---version-10-onwards)
- [0.2. What is it?](#02-what-is-it)
- [0.3. What can you do with it?](#03-what-can-you-do-with-it)
- [0.4. Why do we need it?](#04-why-do-we-need-it)
- [0.5. Is this officially developed by ZM developers?](#05-is-this-officially-developed-by-zm-developers)
- [0.6. How do I install it?](#06-how-do-i-install-it)
    - [0.6.1. Download the server script and its config file](#061-download-the-server-script-and-its-config-file)
    - [0.6.2. Install Dependencies](#062-install-dependencies)
    - [0.6.3. SSL certificate (Generate new, or use ZoneMinder certs if you are already using HTTPS)](#063-ssl-certificate-generate-new-or-use-zoneminder-certs-if-you-are-already-using-https)
        - [0.6.3.1. IOS Users](#0631-ios-users)
    - [0.6.4. Making sure everything is running (in manual mode)](#064-making-sure-everything-is-running-in-manual-mode)
    - [0.6.5. Running it as a daemon so it starts automatically along with ZoneMinder](#065-running-it-as-a-daemon-so-it-starts-automatically-along-with-zoneminder)
    - [0.6.6. How can I use this with Node-Red or Home Assistant?](#066-how-can-i-use-this-with-node-red-or-home-assistant)
- [0.7. Disabling security](#07-disabling-security)
- [0.8. How do I safely upgrade zmeventserver to new versions?](#08-how-do-i-safely-upgrade-zmeventserver-to-new-versions)
- [0.9. Understanding zmeventnotification configuration](#09-understanding-zmeventnotification-configuration)
- [0.10. Troubleshooting common situations](#010-troubleshooting-common-situations)
    - [0.10.1. Secure mode just doesn't work (WSS) - WS works](#0101-secure-mode-just-doesnt-work-wss---ws-works)
    - [0.10.2. I'm not receiving push notifications in zmNinja](#0102-im-not-receiving-push-notifications-in-zmninja)
    - [0.10.3. The server runs fine when manually executed, but fails when run in daemon mode (started by zmdc.pl)](#0103-the-server-runs-fine-when-manually-executed-but-fails-when-run-in-daemon-mode-started-by-zmdcpl)
    - [0.10.4. When you run zmeventnotifiation.pl manually, you get an error saying 'port already in use' or 'cannot bind to port' or something like that](#0104-when-you-run-zmeventnotifiationpl-manually-you-get-an-error-saying-port-already-in-use-or-cannot-bind-to-port-or-something-like-that)
    - [0.10.5. Great Krypton! I just upgraded ZoneMinder and I'm not getting push anymore!](#0105-great-krypton-i-just-upgraded-zoneminder-and-im-not-getting-push-anymore)
- [0.11. How do I disable secure (WSS) mode?](#011-how-do-i-disable-secure-wss-mode)
- [0.12. Debugging and reporting problems](#012-debugging-and-reporting-problems)
- [0.13. For Developers writing their own consumers](#013-for-developers-writing-their-own-consumers)
    - [0.13.1. How do I talk to it?](#0131-how-do-i-talk-to-it)
        - [0.13.1.1. Authentication messages](#01311-authentication-messages)
        - [0.13.1.2. Control messages](#01312-control-messages)
            - [0.13.1.2.1. Control message to restrict monitor IDs for events as well as interval durations for reporting](#013121-control-message-to-restrict-monitor-ids-for-events-as-well-as-interval-durations-for-reporting)
            - [0.13.1.2.2. Control message to get Event Server version](#013122-control-message-to-get-event-server-version)
        - [0.13.1.3. Alarm notifications](#01313-alarm-notifications)
        - [0.13.1.4. Push Notifications (for both iOS and Android)](#01314-push-notifications-for-both-ios-and-android)
            - [0.13.1.4.1. Concepts of Push and why it is only for zmNinja](#013141-concepts-of-push-and-why-it-is-only-for-zmninja)
            - [0.13.1.4.2. Registering Push token with the server](#013142-registering-push-token-with-the-server)
            - [0.13.1.4.3. Badge reset](#013143-badge-reset)
        - [0.13.1.5. Testing from command line](#01315-testing-from-command-line)
- [0.14. How scalable is it?](#014-how-scalable-is-it)
- [0.15. Brickbats](#015-brickbats)

<!-- /TOC -->

## 0.1. Breaking Changes
### 0.1.1. Breaking changes - version 1.0 onwards
Version 1.0 moves configuration to a separate `zmeventnotification.ini` file that makes it easier to re-configure. If you are already
a user of previous versions and want to migrate to 1.0, please make sure you copy `zmeventnotification.ini` to `/etc`. You will need
to re-configure the params to your liking in the ini file. Note that you may need to install some additional packages like `Config::IniFiles` if it complains of missing libraries.

If you are installing `zmeventnotification` for the first time, just read the [How do I install it?](#how-do-i-install-it) section.


## 0.2. What is it?
>>>>>>> upstream/master
A WSS (Secure Web Sockets) and/or MQTT  based event notification server that broadcasts new events to any authenticated listeners.
(As of 0.6, it also includes a non secure websocket option, if that's how you want to run it). Check out the original source [here](https://github.com/pliablepixels/zmeventserver)!

## What is diffrent?
With this fork, you can activate a virtual device in Domoticz by an alarm in Zoneminder, such as a motion detector.
Currently, only activation a virtual device is supported by an alert in Zoneminder. This has the consequence that the motion detector always remains "ON" in Domoticz. Add a "Off Delay" in Domoticz device settings is a possible workaround. The Lua script will handle this for you and turns the Motion Sensor on for 30 sec.
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