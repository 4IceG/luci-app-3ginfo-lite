# luci-app-3ginfo-lite

![GitHub release (latest by date)](https://img.shields.io/github/v/release/4IceG/luci-app-3ginfo-lite?style=flat-square)
![GitHub stars](https://img.shields.io/github/stars/4IceG/luci-app-3ginfo-lite?style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/4IceG/luci-app-3ginfo-lite?style=flat-square)
![GitHub All Releases](https://img.shields.io/github/downloads/4IceG/luci-app-3ginfo-lite/total)

> [!NOTE]
> Luci-app-3ginfo-lite is fork from https://github.com/obsy/modemdata
>
><img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Luci-app-3ginfo-lite is a simplified version of the 3ginfo project. Works with mPCI-E/M.2 and USB 3G/LTE modems.   
> <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Luci-app-3ginfo-lite jest uproszczoną wersją projektu 3ginfo. Działa z modemami mPCI-E/M.2 oraz USB 3G/LTE.

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> What You Should Know / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Co powinieneś wiedzieć
> [!IMPORTANT]
> My package will not work if you are using ModemManager.   
> Preferred version OpenWrt >= 21.02.
>
> Mój pakiet nie będzie działać jeżeli uzywasz ModemManager-a.   
> Preferowana wersja OpenWrt >= 21.02.

``` bash
Supported devices (list may not be up to date):
- ASKEY WWHC050
- BroadMobi BM806U (DLINK DWR-921 C1)
- DW5809e Dell Wireless 5809e Gobi 4G LTE Mobile Broadband Card (EM7305)
- DW5811e Snapdragon X7 LTE (EM7455B)
- DW5821e Snapdragon X20 LTE
- Fibocom FM150-AE
- Fibocom FM350-GL
- Fibocom L860-GL
- Huawei E3272/E3372/E3276
- Mikrotik R11e-LTE
- Mikrotik R11e-LTE6
- NL952-EAU in ECM mode (LTE CAT18)
- Qualcomm CDMA Technologies MSM
- Quectel EC20-E
- Quectel EC200T
- Quectel EC25
- Quectel EG06
- Quectel EG18-EA
- Quectel EM12-G
- Quectel EM160R-GL
- Quectel EP06
- Quectel RG500Q-EA
- Quectel RG502Q-EA
- Quectel RM500Q-GL
- Quectel RM500U-CNV
- Quectel RM520N-GL
- Sierra Wireless 320u
- Sierra Wireless EM7455
- Sierra Wireless EM9190
- Sierra Wireless MC7710
- SIMCOM SIM8200EA-M2
- Thales Cinterion MV31-W
- Telit LE910-EUG
- Telit LN940 (QMI) / Telit LN940 (MBIM) / HP lt4220 (MBIM) / HP lt4220 (QMI)
- Telit LN940-CP
- YUGA CLM920-NC5
- ZTE MF286
- ZTE MF286A
- ZTE MF286D
- ZTE MF286R
- ZTE MF289F
- ZTE MF28D/MF290
- ZTE MF821
 
Not tested devices (Not all data can be shown and scripts need to be corrected):
 - Fibocom FM150-AE
 - Sierra Wireless MC7710
 - Sierra Wireless EM9190
 - SIMCOM SIM8200EA-M2
 - ASKEY WWHC050
 - Mikrotik R11e-LTE
 - HiLink modems (ZTE / Alcatel)

```


### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Installation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Instalacja

<details>
   <summary>Pokaż | Show me</summary>

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

#### Step 1a. Install sms-tool from Master (Only the current snapshot image).
``` bash
opkg update
opkg install sms-tool
```

#### Step 1b. Download the sms-tool package and install manualy (For older stable version images).

   #### To install the sms-tool package, we need to know the architecture name for router.

<details>
   <summary>Pokaż jak znaleźć architekturę routera | Show how to find a router architecture.</summary>
   

   
   > For example, we are looking for sms-tool for Zbtlink router ZBT-WE3526.   
   
   #### Step 1.
   > We go to the page and enter the name of our router.  
   https://firmware-selector.openwrt.org/
   
   
   #### Step 2.
   > Click on the folder icon and go to the image download page.   
   
   ![](https://github.com/4IceG/Personal_data/blob/master/OpenWrt%20Firmware%20Selector.png?raw=true)
   
   > It should take us to a page   
   https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/
   
   #### Step 3.
   > Then go into the "packages" folder at the bottom of the page.   
   https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/packages/
   
   > We check what the architecture name is for our router. All packets have names ending in mipsel_24kc.ipk, so the architecture we are looking for is mipsel_24kc.
   

</details>

#### Example of sms-tool installation using the command line.
> In the link below, replace ```*architecture*``` with the architecture of your router, e.g. arm_cortex-a7_neon-vfpv4, mipsel_24kc.

``` bash
wget https://downloads.openwrt.org/snapshots/packages/*architecture*/packages/sms-tool_2022-03-21-f07699ab-1_*architecture*.ipk -O /tmp/sms-tool_2022-03-21.ipk
opkg install /tmp/sms-tool_2022-03-21.ipk
```

#### Another way is to download the package manually.
> To do this, we go to the page.   
https://downloads.openwrt.org/snapshots/packages/

> We choose our architecture, e.g. arm_cortex-a7_neon-vfpv4, mipsel_24kc.   
https://downloads.openwrt.org/snapshots/packages/mipsel_24kc/

> Go to the "packages" folder.   
https://downloads.openwrt.org/snapshots/packages/mipsel_24kc/packages/

> Looking for "sms-tool_2022-03-21". We can use search by using Ctr + F and typing "sms-tool".
Save the package to your computer for further installation on the router.

#### Step 2. Add my repository (https://github.com/4IceG/Modem-extras) to the image and follow the commands.
``` bash
opkg update
opkg install luci-app-3ginfo-lite
```

For images downloaded from eko.one.pl.
Installation procedure is similar, only there is no need to manually download the sms-tool package.
 
</details>

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> User compilation / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Kompilacja przez użytkownika

<details>
   <summary>Pokaż | Show me</summary>

``` bash
#The package can be added to Openwrt sources in two ways:

cd feeds/luci/applications/
git clone https://github.com/4IceG/luci-app-3ginfo-lite.git
cd ../../..
./scripts/feeds update -a; ./scripts/feeds install -a
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
</details>

### <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Preview / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Podgląd

![](https://github.com/4IceG/Personal_data/blob/master/zrzuty/luci-app-3ginfo-litemod.png?raw=true)

## <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_United_Kingdom.png" height="24"> Thanks to / <img src="https://raw.githubusercontent.com/4IceG/Personal_data/master/dooffy_design_icons_EU_flags_Poland.png" height="24"> Podziękowania dla
- [obsy (Cezary Jackiewicz)](https://github.com/obsy)
