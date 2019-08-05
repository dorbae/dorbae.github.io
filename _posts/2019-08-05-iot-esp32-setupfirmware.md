---
layout: post
title: "[ESP32] How to flash a firmware into ESP32(LOLIN D32 PRO ver.2.0.0) on MacOS?"
comments: true
author: dorbae
date: 2019-08-05 +0900
categories : [IoT,ESP32]
tags: [iot,esp32]
sitemap :
  changefreq : weekly
---

# Goal
* Flash firmware into ESP32

<br/>

# Intro
* [Wemos LOLIN D32 PRO](https://riot-os.org/api/group__boards__esp32__wemos-lolin-d32-pro.html)
* macOS Mojave 10.14.6

<br />

# Practice

### Setup of Toolchain
* ESP-IDF will use Python
* ESP-IDF essentially contains API (software libraries and source code) for ESP32 and scripts to operate the Toolchain
* If, you need to install pip
``` bash
sudo easy_install pip
```

#### Install pyserial

``` bash
pip install --user pyserial
```

![screenshot001](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-001.png)

<br />

#### Install Cmake & Ninja
* Ninja is a small build system with a focus on speed
* Ninja's low-level approach makes it perfect for embedding into more featureful build systems
* Ninja is used to build Google Chrome, parts of Android, LLVM, and can be used in many other projects due to CMake's Ninja backend.
* ccache is optional. However, it is strongly recommended for faster builds

``` bash
brew install cmake ninja ccache
```

![screenshot003](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-002.png)


![screenshot003](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-003.png)

<br />

### Get ESP-IDF
* To build applications for the ESP32, you need the software libraries provided by Espressif in [ESP-IDF repository](https://github.com/espressif/esp-idf)

#### Create local repository directory and clone
* If you execute below commands, ~/esp/esp-idf directory will be created
* You can use any directory, but you will need to adjust paths for the commands respectively
* Keep in mind that ESP-IDF does not support spaces in paths.

``` bash
mkdir ~/esp
cd ~/esp
git clone --recursive https://github.com/espressif/esp-idf.git
```

![screenshot004](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-004.png)

![screenshot005](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-005.png)

<br />

### Set up the tools

#### Execute ESP-IDF Tools installer

``` bash
cd ~/esp/esp-idf
sh ./install.sh
```

![screenshot006](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-006.png)

<br />

### Set up the environment variables
* The installed tools are not yet added to the PATH environment variable
* To make the tools usable from the command line some environment variables must be set
* You can just execute script which set up variables or add that script in ./profile or .bash_profile

``` bash
cd ~/esp/esp-idf
sh ./export.sh
```

![screenshot007](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-007.png)

<br />

### Start an nexample project
#### Copy an example project to ~/esp directory
``` bash
cd ~/esp
cp -r $IDF_PATH/examples/get-started/hello_world .
```

![screenshot008](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-008.png)

<br />

### Connect Your Device
* Serial ports have the following patterns in their names

| OS | Pattern |
| ---- | ---- |
| Windows | likes **___COM1___** |
| Linux | starting with **___/dev/tty___** |
| macOS | starting with **___/dev/cu.___** |

``` bash
ls /dev/cu*
```

![screenshot009](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-009.png)

<br />


### Build the project

``` bash
idf.py build
```

![screenshot010](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-010.png)

<br />

### Flash onto the device
* Flash the binaries that you just built onto your ESP32 board by running
* -b option is optional and default value is 460800
* I set up baud as 115200

> The option flash automatically builds and flashes the project, so running idf.py build is not necessary

``` bash
idf.py -p [PORT_PATH] {-b [BAUD]} flash
```

![screenshot011](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-011.png)

<br />

### Monitor
* Check if “hello_world” is indeed running
> If you want to stop monitoring, type **Ctrl + ]**

``` bash
idf.py -p [PORT_PATH] monitor
```

![screenshot012](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-012.png)

<br />

### If the messages were not normal
* Your board is likely using a 26MHz crystal
* Most development board designs use 40MHz, so ESP-IDF uses this frequency as a default value

<br />

#### Menu config

``` bash
cd ~/esp/hello_world
idf.py menuconfig
```

![screenshot013](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-013.png)

<br />

#### Component config -> ESP32-specific

![screenshot014](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-014.png)

![screenshot015](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-015.png)

<br />

#### Main XTAL frequency
* Change **CONFIG_ESP32_XTAL_FREQ_SEL** to 26MHz

![screenshot016](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-016.png)

![screenshot017](/assets/images/posts/2019/08/2019-08-05-iot-esp32-setupfirmware-017.png)

<br />

-------------

## References
* [ESPRESSIF Get Started](https://docs.espressif.com/projects/esp-idf/en/latest/get-started/index.html)
* [Wemos LOLIN D32 Pro](https://riot-os.org/api/group__boards__esp32__wemos-lolin-d32-pro.html)
* [Ninja](https://ninja-build.org/)