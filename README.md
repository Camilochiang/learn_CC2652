# Goal
Have battery power sensors, that are not available in the market, that can be located in the middle of a barn or haystack for example

##  Getting started 
We wil First start getting to know the I2C sensors. For this we use RPI and I2C as RPi include pull down resistors (1.8k) and 3.3 V GPIO pins for the logics, what is exactly the same that we want for later on. We will be using the following sensors
- flow sensor
- differencial pressure

## Rpi
You can see the examples in `` a ``
TODO: recover documents from Rpi

## Going serius: CC26552RB
We will start with the usb stick from [slae](https://slae.sh/projects/cc2652/#zigbee2mqtt), which have have mainly two chips
- CP2102N that allow to load the program to the CC2652R (USB to UART bridge)
- and the CC2652R that can work as a end device, coordinator and router.

The first step is to test if it properly works using python
```bash
python -m pip install pyserial
python 1_test.py -p /dev/tty.usbserial-1410
```

As we will use the device as a end device, we need to flash the firmware. For that we can use the software provided by these repos
```bash
git clone https://github.com/slaesh/cc2652-stick
git clone https://github.com/JelmerT/cc2538-bsl
```

We will need to write our own firmaware using the CCS - Code Composer Studio from TI downloable from [here](https://www.ti.com/tool/download/CCSTUDIO). To be able of using CCS you also need make. in mac for example:

```bash
brew install make
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH" >> .bashrc
```

### 0. Before starting

Before starting with the CC2652RB there are some precautions to have in mind:
- After we create a project in CCS is important to enable bootlander in the .syscfg (.syscfg file, t1 device, device configuration: enable bootlander, enable bootlander backdoor, pin 13, active low)
- We will want to generate a bin file that we will later upload into our MCU. We can do that doing righ click in project, properties, build, steps and added this to generate the bin file: `"${CG_TOOL_ROOT}/bin/tiarmobjcopy" -O binary "${BuildArtifactFileName}" "${BuildArtifactFileBaseName}.bin"`

Regarding CCS
- You can always import older projects as a folder (as for example the project from slaesh) : file, import project

### 1. Blink example

We can create a new project selecting our chip : CC2652RB1F and TI arm clang. there are many examples but in our case we can just import my basic example:

buildining it and now I have our bin file!
```bash
/Users/camilochiang/Documents/tmp/20250619_LED/Debug/20250619_LED.bin
```

We can upload it with python:
```bash
./cc2538-bsl/cc2538_bsl/cc2538_bsl.py -p /dev/tty.usbserial-1410 -evw 20250619_LED/Debug/20250619_LED.bin
```

### 2. Read I2C sensor

For this example we will actually use serial communication. I like minicom
SDA --> 22 SCL --> 11 (the 5th after at both sides )
my setting: SDA (Blue) --> 11 (5th bottom), 
    SCL (orange) --> 22 (5h top)

now we can upload and in a new window check the serial communication

```bash
./cc2538-bsl/cc2538_bsl/cc2538_bsl.py -p /dev/tty.usbserial-1420 -evw 20250621_i2ctmp/Debug/20250621_i2ctmp.bin
screen /dev/tty.usbserial-1410 115200,cs8,parenb,-cstopb,ixon=-ixon
```

Both works! serial communication and I2C 😀

TODO: implement data adquisition (copy paste from Rpi kind off)

### 3. Zigbee

And now the hardest part. Zigbee

TI provide examples for:
- zc: Zigbee coordinator: it take care of forming and maintaining the Zigbee network. 
- zed: Zigbee end device: sensors, actuators, switchers
- zr: Zigbee router: it redirect messages from far away `zed`s to `zc`s.

We will start with the zed_temperaturesensor example as base for our sensors. Additionaly we will apply the above examples to produce a bin file and the bootlander
