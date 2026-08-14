Code was made for zeptoforth on RP2040/RP2350 boards to expose internal flash memory as USB Mass Storage device (USB flash).


Usage:
Upload usb_msc.fs with codeload3 via serial port on zeptoforth without usb console.
You must define two constants before uploading: usb-console? - switch to usb console after loading if true;
usb-msc-blocks - address of blocks class object, described in block-dev module, can be internal flash or sd-card (not tested).

Even with usb-console set to false you can use words like with-usb-output or with-usb-input.

example of loading script:
```
defined? setup-blocks-fat32 not [if]
	#include extra/common/setup_blocks_fat32.fs 
[else]
	reboot
[then]


simple-blocks-fat32 import
simple-blocks-fat32-internal import

setup-blocks-fat32::my-fs simple-blocks-fat32-dev 

simple-blocks-fat32-internal unimport
simple-blocks-fat32 unimport

\ compile-to-flash   \ uncoment for compile to flash

constant usb-msc-blocks         \ modules above needed to get blocks object address
false constant usb-console?     \ true to switch console to USB

#include usb_msc.fs

\ reboot \ needed after compilation to flash

```



You can format "flash drive" in linux or windows but fat32-tools can't work with it.
Device can be mounted in linux with:
`sudo mount -t vfat -o uid=<user> /dev/sd<x>1 <mount point>`


