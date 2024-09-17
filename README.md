```
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
```

Dotfiles managed via [stow](https://www.gnu.org/software/stow/), following [this guide](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html). They are licensed with the GPLv3.

## setup

The dotfiles are configuring three very different systems and depend on a list of software. The systems are:

### rakete

**type**: desktop pc\
**screens**:
* DVI-D-1: 2560x1440
* DP-2: 1280x1024

**cpu**: AMD Ryzen 7 5700X 8C16T @ 3.4-4.6 GHz\
**gpu**: GIGABYTE Radeon RX 6750XT 12GiB Gaming OC\
**ram**: 16GiB DDR4-3000\
**disk**:
* 500G NVMe - Windows C: (NTFS) + WSL using [Void Linux Musl](https://github.com/am11/VoidMuslWSL) | /boot (FAT32)
* 256G SSD - [Void Linux](https://voidlinux.org) / (XFS)
* 500G HDD - /home (ext4) | 32G SWAP
* 1T HDD - D: (NTFS)
* BD-RW

### maschine

**type**: Lenovo Yoga Slim 7\
**screen**: 1920x1080\
**cpu**: AMD Ryzen 7 4800U 8C16T @ 1.8-4.2 GHz\
**gpu**: AMD Radeon RX Vega 8\
**ram**: 16GiB LPDDR4X-4266\
**disk**: 480G NVMe - 1G /boot (FAT32) | 64G [Void Linux](https://voidlinux.org) (XFS) / | 192G /home (ext4) | 220G Windows C: (NTFS)

### generator

**type**: Raspberry Pi 4\
**screen**: none\
**cpu**: ARM Cortex-A72 4C4T @ 1.5GHz\
**gpu**: unused\
**ram**: 2GiB\
**disk**:
* 15G microSD - [Alpine Linux](https://alpinelinux.org) (FAT32)
* 4T HDD - data (NTFS)

The different modules have the following dependencies:

### [alacritty](https://github.com/alacritty/alacritty)

* [xdg-utils](https://www.freedesktop.org/wiki/Software/xdg-utils/)

### [ash](https://busybox.net)

* relies on the ```env``` module of this repository

### [bash](https://www.gnu.org/software/bash/)

* relies on the ```env``` module of this repository

### env - shell independent configuration

* [alpine-sysinfo](https://github.com/tmahlburg/bin/blob/main/alpine-sysinfo) - autostart
* [sway](https://swaywm.org) - autostart
* [ssh-agent](https://www.openssh.com) - autostart
* [tar](https://www.gnu.org/software/tar/tar.html) - function
* [bunzip2](https://sourceware.org/bzip2/) - function
* [unrar](https://www.rarlab.com/rar_add.htm) - function
* [pigz](https://zlib.net/pigz/) - function
* [unzip](http://infozip.sourceforge.net) - function
* [uncompress](https://www.gzip.org) - function
* [7z](http://p7zip.sourceforge.net) - function
* [xz](https://tukaani.org/xz/format.html) - function
* [markdown](http://www.pell.portland.or.us/~orc/Code/discount/) - function
* [doas](https://github.com/Duncaen/OpenDoas) - function
* [pacman](https://archlinux.org/pacman/) - alias
* [git](https://git-scm.com) - alias
* [youtube-dl](https://youtube-dl.org) - alias
* [source-highlight](https://www.gnu.org/software/src-highlite/) - alias
* [vivado](https://www.xilinx.com/products/design-tools/vivado.html] - alias
* [curl](https://curl.se) - alias
* [xdg-dekstop-portal](https://github.com/flatpak/xdg-desktop-portal) - alias
* [xdg-desktop-portal-wlr](https://github.com/emersion/xdg-desktop-portal-wlr)
* [itch](https://itch.io/app) - alias
* [tfm](https://github.com/tmahlburg/tfm) - alias
* [elinks](http://elinks.or.cz) - as $TUI_BROWSER
* [less](http://www.greenwoodsoftware.com/less/) - as $PAGER
* [kakoune](https://kakoune.org) - as $EDITOR
* [go](https://golang.org) - set $GOPATH

* references the ```wayland``` module in this repository

### fonts

* [DejaVu](https://dejavu-fonts.github.io)
* [Noto](https://www.google.com/get/noto/)
* [FontAwesome](https://fontawesome.com)
* [Go Mono](https://go.dev/blog/go-fonts)

### [kakoune](https://kakoune.org)

* [plug.kak](https://github.com/andreyorst/plug.kak)
* [shellcheck](https://www.shellcheck.net)
* [autopep8](https://pypi.org/project/autopep8/)
* [flake8](https://flake8.pycqa.org)
* [indent](https://www.gnu.org/software/indent/)
* [clang](https://clang.llvm.org)
* [verilog_lint](https://github.com/tmahlburg/bin/blob/main/verilog_lint)
* [iverilog](http://iverilog.icarus.com)
* [tex live](https://www.tug.org/texlive/)
* [go](https://golang.org)
* [python-language-server](https://github.com/palantir/python-language-server)
* [clangd](https://clangd.llvm.org)
* [gopls](https://pkg.go.dev/golang.org/x/tools/gopls)
* [texlab](https://github.com/latex-lsp/texlab)

### [mpv](https://mpv.io)

* [vaapi](https://www.freedesktop.org/wiki/Software/vaapi/)

### [nano](https://www.nano-editor.org)

* none

### [onedrive](https://abraunegg.github.io)

* none

### [sway](https://swaywm.org)

* [alacritty](https://github.com/alacritty/alacritty) - key binding
* [pcmanfm-qt](https://github.com/lxqt/pcmanfm-qt) - key binding
* [tofi](https://github.com/philj56/tofi) - key binding
* [grim](https://github.com/emersion/grim) - key binding
* [pamixer](https://github.com/cdemoulins/pamixer) - key binding
* [brightnessctl](https://github.com/Hummer12007/brightnessctl) - key binding
* [steam](https://store.steampowered.com/about/) - setting
* [yambar](https://codeberg.org/dnkl/yambar) - autostart
* [gammastep](https://gitlab.com/chinstrap/gammastep) - autostart
* [swayidle](https://github.com/swaywm/swayidle) - autostart
* [pipewire](https://pipewire.org) - autostart
* [pipewire-pulse](https://pipewire.org) - autostart
* [wireplumber](https://pipewire.pages.freedesktop.org/wireplumber/) - autostart
* references to the ```wayland``` module in this repository

### [wayland](https://wayland.freedesktop.org)

* [sway](https://swaywm.org)
* [mesa-vaapi](https://mesa3d.org)
* [mesa-vdpau](https://mesa3d.org)
* [qt5ct](https://github.com/desktop-app/qt5ct)
* [qt6ct](https://github.com/trialuser02/qt6ct)

### xdg

* [xdg-user-dirs](https://freedesktop.org/wiki/Software/xdg-user-dirs/)

### [yambar](https://codeberg.org/dnkl/yambar)

* [FontAwesome](https://fontawesome.com)

### [zsh](https://www.zsh.org)

* relies on the ```env``` module in this repository
