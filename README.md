# luci-app-3ginfo-lite

![GitHub release (latest by date)](https://img.shields.io/github/v/release/4IceG/luci-app-3ginfo-lite?style=flat-square)
![GitHub stars](https://img.shields.io/github/stars/4IceG/luci-app-3ginfo-lite?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/4IceG/luci-app-3ginfo-lite?style=flat-square)
![GitHub All Releases](https://img.shields.io/github/downloads/4IceG/luci-app-3ginfo-lite/total)

Luci-app-3ginfo-lite is fork from https://github.com/obsy/packages/tree/master/easyconfig/addon

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="32">
Luci-app-3ginfo-lite is a simplified version of the 3ginfo project. Works with mPCI-E and USB 3G/LTE modems.

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="32">
Luci-app-3ginfo-lite jest uproszczoną wersją projektu 3ginfo. Działa na modemach mPCI-E oraz USB 3G/LTE.


``` bash
Supported & tested devices:
 - Quectel EM12/EM160R-GL
 - Huawei E3372/E3276
 
NOT tested devices (Or not fully supported):
 - Quectel EC20
 - Sierra Wireless MC7710
 - ASKEY WWHC050
 - ZTE MF821
 - BroadMobi BM806U
 - Quectel EP06
 - Mikrotik R11e-LTE

```

## <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="32"> Installation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="32"> Instalacja
``` bash
Modem drivers are required for proper operation.
opkg install kmod-usb-serial kmod-usb-serial-option

Dependency required.
opkg install sms-tool

Install app.
opkg install luci-app-3ginfo-lite_1.0.3-14072021_all.ipk

```


### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="32"> Preview / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="32"> Podgląd

![](https://raw.githubusercontent.com/4IceG/Personal_data/master/3ginfo-lite_1.0.3.png)

## <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="32"> Thanks to / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="32"> Podziękowania dla
- [obsy (Cezary Jackiewicz)](https://github.com/obsy)
