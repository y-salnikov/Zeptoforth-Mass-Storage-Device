Code was made for zeptoforth on RP2040/RP2350 boards to expose internal flash memory as USB Mass Storage device (USB flash).


Usage:
Upload main.fs with codeload3

run `prepare` if no FS initialized in block device

You can format "flash drive" in linux or windows but fat32-tools can't work with it.
Device can be mounted in linux with root privileges like:
`sudo mount -t vfat /dev/sd<x>1 <mount point>`

Mounting device indicated by led.
