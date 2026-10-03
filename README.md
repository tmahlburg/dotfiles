<pre align="center">
╔═════════════════════════════════════════════════════════════════════════╗
║                                                                         ║
║       █████           █████       ██████   ███  ████                    ║
║      ░░███           ░░███       ███░░███ ░░░  ░░███                    ║
║    ███████   ██████  ███████    ░███ ░░░  ████  ░███   ██████   █████   ║
║   ███░░███  ███░░███░░░███░    ███████   ░░███  ░███  ███░░███ ███░░    ║
║  ░███ ░███ ░███ ░███  ░███    ░░░███░     ░███  ░███ ░███████ ░░█████   ║
║  ░███ ░███ ░███ ░███  ░███ ███  ░███      ░███  ░███ ░███░░░   ░░░░███  ║
║  ░░████████░░██████   ░░█████   █████     █████ █████░░██████  ██████   ║
║   ░░░░░░░░  ░░░░░░     ░░░░░   ░░░░░     ░░░░░ ░░░░░  ░░░░░░  ░░░░░░    ║
║                                                                         ║
╚═════════════════════════════════════════════════════════════════════════╝
</pre>

Dotfiles managed via [stow](https://www.gnu.org/software/stow/)/
[xstow](https://github.com/rspeed/xstow), following
[this guide](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).
They are licensed under the terms of the GPLv3.

## setup

The dotfiles are configuring a few different systems and depend on a list of software. The systems are:

### yolanda / saffron (desktop)

**type**: Fractal Design Pop Mini Air RGB\
**screens**:
* DP-2: 2560x1440@165Hz
* DP-3: 1280x1024@60Hz

**cpu**: AMD Ryzen 5 9600X 6C12T @ 3.9-5.4 GHz\
**gpu**: PowerColor Reaper Radeon RX 9070XT 16GiB \
**ram**: 32GiB DDR5-6000 CL36\
**disk**:
* 1T NVMe - Windows C: (NTFS)
* 500G NVMe - [Chimera Linux](https://chimera-linux.org) / (ext4)
* 3T SATA HDD @ 7.2k RPM - D: / /mnt/shared (NTFS)
* BD-RW

### mal (laptop)

**type**: HP ZenBook 8 G1ak\
**screen**: 2560x1600@120Hz\
**cpu**: AMD Ryzen AI 7 PRO 350 8C16T @ 2-5 GHz\
**gpu**: AMD Radeon 860M\
**ram**: 32GiB LPDDR4X-4266\
**disk**: 1T NVMe - 1G /boot (FAT32) | 36G Swap | 200G [Void Linux](https://voidlinux.org) / (btrfs) | 717G /home (ext4)

### serenity (nas)

**type**: Jonsbo N2\
**screen**: none\
**cpu**: AMD Ryzen 7 5700X 8C16T @ 3.5-4.6GHz \
**ram**: 32GiB DDR4-2400 ECC\
**disk**:
* 128G NVMe - [FreeBSD](https://www.freebsd.org) / (ZFS)
* 3*8T SATA HDDs @ 5.4k RPM - /cargo (RAID-Z1)
* 500G SATA SSD - /stash (ZFS)

### inara (router)

**type**: Fujitsu Futro S920\
**screen**: none\
**cpu**: AMD GX-222GC 1C2T @ 2.2-2.4 GHz\
**gpu**: AMD Radeon R5E\
**ram**: 8GiB DD3-1600\
**disk**: 256G mSATA SSD - [OpenBSD](https://www.openbsd.org/index.html)

### jayne (backup)

**type**: AeroCool AeroCube M40\
**screen**: none\
**cpu**: AMD Ryzen 3 2200G 4C4T @ 3.5-3.7 GHz\
**gpu**: AMD Radeon Vega 8\
**ram**: 16GiB DDR4-3000\
**disk**:
* 128G NVMe - [OmnisOS CE](https://omnios.org) / (ZFS)
* 2*6T SATA HDDs @ 7.2k RPM - /vault (ZFS mirror)

### bionb161 (work laptop)

**type**: MacBook Pro 14\
**screen**: 3024x1964@120Hz\
**cpu**: Apple M4 Pro 12C(8P4E)12T\
**gpu**: Apple M4 Pro\
**ram**: 24GiB
**disk**: 1TiB SSD - MacOS /

The different modules have the following dependencies:

### [ash](https://busybox.net)

* relies on ```env```

### [bash](https://www.gnu.org/software/bash/)

* relies on ```env```

### env - shell independent configuration

* references the ```wayland``` module

### ksh

* relies on ```env```

### [sway](https://swaywm.org)

* references the ```wayland``` module

### [zsh](https://www.zsh.org)

* relies on ```env``` module
