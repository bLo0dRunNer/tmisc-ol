lenovo-g580-brightness-control
==============================

Scripts to allow brighness control on linux Lenovo IdeaPad G580. Adds acpi events mappings for acpid.

Modified the scripts from thrull (https://github.com/thrull/lenovo-yoga-brightness-control), based on
the scripts from codingtony (https://github.com/codingtony/acer-brightness-linux-acpi)

Tested on Lenovo IdeaPad G580 (20157) with Gentoo Linux:
"Kernel 3.12.13 Gentoo-Sources x86_64 Intel(R) Pentium(R) CPU B960 @ 2.20GHz GenuineIntel GNU/Linux"

## Installation
To install just run install.sh script with super-user privileges:

./install.sh

or copy files manually to /etc/acpi directory and restart acpid service.

systemd:
systemctl restart acpid

openrc:
/etc/init.d/acpid restart

## Output via acpi_listen

blood@ExecMobile ~ $ acpi_listen 
video/brightnessup BRTUP 00000086 00000000
video/brightnessdown BRTDN 00000087 00000000

## Note

For all the Fn-Keys to work I had to use the kernel parameter acpi_osi=\"!Windows 2012\" any other combination 
resulted in either some Fn-Keys not working or the brightness up/down combination not having a key-event.
