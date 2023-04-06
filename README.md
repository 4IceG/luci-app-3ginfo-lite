# luci-app-3ginfo-lite

![GitHub release (latest by date)](https://img.shields.io/github/v/release/4IceG/luci-app-3ginfo-lite?style=flat-square)
![GitHub stars](https://img.shields.io/github/stars/4IceG/luci-app-3ginfo-lite?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/4IceG/luci-app-3ginfo-lite?style=flat-square)
![GitHub All Releases](https://img.shields.io/github/downloads/4IceG/luci-app-3ginfo-lite/total)

Luci-app-3ginfo-lite is fork from https://github.com/obsy/packages/tree/master/easyconfig/files/usr/share/easyconfig/modem

#### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Luci-app-3ginfo-lite is a simplified version of the 3ginfo project. Works with mPCI-E/M.2 and USB 3G/LTE modems.

#### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Luci-app-3ginfo-lite jest uproszczoną wersją projektu 3ginfo. Działa z modemami mPCI-E/M.2 oraz USB 3G/LTE.


``` bash
Supported devices (tested devices):
 - Fibocom L860-GL
 - Mikrotik R11e-LTE6
 - Quectel EM12/EM160R-GL
 - Quectel EP06-E
 - Quectel EC20/EC25
 - Quectel RG502Q
 - Quectel RM520N-GL
 - ZTE MF821
 - ZTE MF286/MF286A/MF289F HW AT2
 - ZTE MF286D/MF289F HW AT1
 - ZTE MF286R (Modem comes in several versions, not all work stably)
 - Huawei E3372/E3276
 - Huawei E3276 HiLink
 - Huawei E5786 (mobile-wifi / HiLink)
 - Sierra AirCard 320U
 - Telit Ln940 / HP lt4220
 
Not tested devices (Not all data can be shown and scripts need to be corrected):
 - Fibocom FM150-AE
 - Sierra Wireless MC7710
 - Sierra Wireless EM7455
 - ASKEY WWHC050
 - BroadMobi BM806U
 - Mikrotik R11e-LTE
 - HiLink modems (ZTE / Alcatel)

```

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> What You Should Know / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Co powinieneś wiedzieć
> My package will not work if you are using ModemManager.

> Mój pakiet nie będzie działać jeżeli uzywasz ModemManager-a.


### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Installation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Instalacja

#### Package dependencies for conventional modems.
Modem drivers are required for proper operation.
``` bash
opkg install kmod-usb-serial kmod-usb-serial-option sms-tool
```

#### Package dependencies for HiLink modems.
``` bash
opkg install wget-nossl sms-tool
```

The sms-tool package is available in the OpenWrt Master repository.

#### Step 1a. Install sms-tool from Master.
``` bash
opkg update
opkg install sms-tool
```

#### Step 1b. Download the sms-tool package and install manualy.
An example link to the package.

In the link below, replace ```*architecture*``` with the architecture of your router, e.g. arm_cortex-a7_neon-vfpv4, mipsel_24kc.
``` bash
https://downloads.openwrt.org/snapshots/packages/*architecture*/packages/sms-tool_2022-03-21-f07699ab-1_*architecture*.ipk
```
Example of package installation (file downloaded with wget-ssl).
``` bash
wget https://downloads.openwrt.org/snapshots/packages/aarch64_cortex-a72/packages/sms-tool_2022-03-21-f07699ab-1_aarch64_cortex-a72.ipk -O /tmp/sms-tool_2022-03-21.ipk
opkg install /tmp/sms-tool_2022-03-21.ipk
```

For images downloaded from eko.one.pl.
Installation procedure is similar, only there is no need to manually download the sms-tool package.

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> User compilation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Kompilacja przez użytkownika
``` bash
#The package can be added to Openwrt sources in two ways:

cd feeds/luci/applications/
git clone https://github.com/4IceG/luci-app-3ginfo-lite.git
cd ../../..
./scripts feeds update -a; ./scripts/feeds install -a
make menuconfig

or e.g.

cd packages/
git clone https://github.com/4IceG/luci-app-3ginfo-lite.git
git pull
make package/symlinks
make menuconfig

#You may need to correct the file paths and the number of folders to look like this:
feeds/luci/applications/luci-app-3ginfo-lite/Makefile
or
packages/luci-app-3ginfo-lite/Makefile

#Then you can compile the packages one by one, an example command:
make V=s -j1 feeds/luci/applications/luci-app-3ginfo-lite/compile
```


### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Preview / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Podgląd

![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/3ginfo_last.png?raw=true)

## <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Thanks to / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Podziękowania dla
- [obsy (Cezary Jackiewicz)](https://github.com/obsy)
