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

TMPPATH="/tmp/grub2patches"

src_install() {

# insinto "${TMPPATH}"
# doins "${FILESDIR}"/*.patch
# fperms -v +x "${TMPPATH}"/*.patch
# doins "${FILESDIR}"/00_header.patch
# doins "${FILESDIR}"/10_linux.patch
# doins "${FILESDIR}"/grub.patch
# doins "${FILESDIR}"/grub2-mkconfig.patch

 #patch -b --verbose "/etc/grub.d/00_header" < "${TMPPATH}"/00_header.patch
 #patch -b --verbose "/etc/grub.d/10_linux" < "${TMPPATH}"/10_linux.patch
 #patch -b --verbose "/etc/default/grub" < "${TMPPATH}"/grub.patch
 #patch -b --verbose "/usr/sbin/grub2-mkconfig" < "${TMPPATH}"/grub2-mkconfig.patch


#   elog "setting install directory"
#   insinto "${TMPPATH}"
#   insinto ${D}

#   elog "installing files"
#   doins "${FILESDIR}"/*.patch

   elog "creating script file"
   echo "#!/bin/bash" > applygpatches || die
   echo "patch -b --verbose /etc/grub.d/00_header < ${FILESDIR}/00_header.patch" >> applygpatches || die
   echo "patch -b --verbose /etc/grub.d/10_linux < ${FILESDIR}/10_linux.patch" >> applygpatches || die
   echo "patch -b --verbose /etc/default/grub < ${FILESDIR}/grub.patch" >> applygpatches || die
   echo "patch -b --verbose /usr/sbin/grub2-mkconfig < ${FILESDIR}/grub2-mkconfig.patch" >> applygpatches || die

#   insinto "${TMPPATH}"
#   doins "${FILESDIR}"/applypatches

   elog "changing permission"
   fperms -v +x applygpatches
   ./applygpatches
#   fperms -v +x "${TMPPATH}"/applypatches
#   elog "executing patch script"
#   ./tmp/grub2patches/applypatches
#   ."${TMPPATH}"/applypatches

}

pkg_postinst() {

#   rm -rf /tmp/grub2patches/

	einfo
        einfo "Two additional variables should be patched into /etc/default/grub:"
        einfo "1. GRUB_ENABLE_SUBMENU: should let you enable/disable the submenu-structure"
        einfo "2. GRUB_CUSTOM_LANG: should let you disable the language autodetection by"
        einfo "                     setting the variable to a language abbreviation."
	einfo

}
