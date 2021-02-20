# getkernels-auto

getkernels-auto is a KUAL extension that allows users to backup kernel images from the MMC of a Kindle device. It achieves this by acting as a simple wrapper around the original `getkernels.sh` script written by Geekmaster.

The kernel backups created using this extension can be flashed back to a compatible Kindle using Fastboot-Kindle.

---

## Compatibility
This extension should be compatible with all devices supported by the original script (i.e K3 onwards).

--- 
## Usage
- To install, copy or clone the extension to the KUAL extension folder at `/mnt/us/extensions`
- To run this extension, select the `getkernels-auto` item from the KUAL menu
- The kernel dumps created by this extension can be found within the `/mnt/us/kernels` directory

---

## Links
- [Original script by Geekmaster](https://www.mobileread.com/forums/showthread.php?t=174674)
- [Fastboot-Kindle](https://github.com/TobiasWooldridge/Fastboot-Kindle)