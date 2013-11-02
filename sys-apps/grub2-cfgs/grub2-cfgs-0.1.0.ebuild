# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Additional configuration variables for Grub2"
HOMEPAGE="https://github.com/bLo0dRunNer/tmisc-ol/"


SRC_URI=""

LICENSE="Grub2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror strip"

RDEPEND="sys-boot/grub:2"

src_install() {

   insinto /tmp/grub2patches
   doins "${FILESDIR}"/*

#   echo "#!/bin/bash" > applypatches || die
#   echo "patch -b --verbose /etc/grub.d/00_header < ./00_header.patch" > applypatches || die
#   echo "patch -b --verbose /etc/grub.d/10_linux < ./10_linux.patch" >> applypatches || die
#   echo "patch -b --verbose /etc/default/grub < ./grub.patch" >> applypatches || die
#   echo "patch -b --verbose /usr/sbin/grub2-mkconfig < ./grub2-mkconfig.patch" >> applypatches || die

   fperms +x applygrubpatches
   ./applygrubpatches

#   rm -rf /var/tmp/portage/sys-apps/

}

pkg_postinst() {

   rm -rf /tmp/grub2patches/

	einfo
        einfo "Two additional variables should be patched into /etc/default/grub:"
        einfo "1. GRUB_ENABLE_SUBMENU: should let you enable/disable the submenu-structure"
        einfo "2. GRUB_CUSTOM_LANG: should let you disable the language autodetection by"
        einfo "                     setting the variable to a language abbreviation."
	einfo

}
