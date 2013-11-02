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

   insinto /tmp/grub2patches/
   doins "${FILESDIR}"/*.patch

   echo "#!/bin/bash" > apply_patches || die
   echo "echo 'patch -b --verbose /etc/grub.d/00_header < /tmp/grub2patches/00_header.patch'" > apply_patches || die
   echo "echo 'patch -b --verbose /etc/grub.d/10_linux < /tmp/grub2patches/10_linux.patch'" >> apply_patches || die
   echo "echo 'patch -b --verbose /etc/default/grub < /tmp/grub2patches/grub.patch'" >> apply_patches || die
   echo "echo 'patch -b --verbose /usr/sbin/grub2-mkconfig < /tmp/grub2patches/grub2-mkconfig.patch'" >> apply_patches || die

   insinto /tmp/grub2patches/
   dobin apply_patches
   fperms +x apply_patches
   exec apply_patches

}

pkg_postinst() {
	einfo
        einfo "Two additional variables should be patched into /etc/default/grub:"
        einfo "1. GRUB_ENABLE_SUBMENU: should let you enable/disable the submenu-structure"
        einfo "2. GRUB_CUSTOM_LANG: should let you disable the language autodetection by"
        einfo "                     setting the variable to a language abbreviation."
	einfo
}
