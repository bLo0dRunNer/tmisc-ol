# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="This package takes care of installing the libraries for the opensteamworks pidgin extension"
HOMEPAGE="https://github.com/bLo0dRunNer/tmisc-ol/"

SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror strip"

RDEPEND="
	net-im/pidgin
	x11-plugins/pidgin-opensteamworks
	"

src_install() {
        insinto ~/.purple/plugins
        doins "${FILESDIR}"/libsteam-1.3.so
        doins "${FILESDIR}"/libsteam64-1.3.so

        insinto /usr/share/pixmaps/pidgin/protocols/16
        doins "${FILESDIR}"/16/steam.png

        insinto /usr/share/pixmaps/pidgin/protocols/48
        doins "${FILESDIR}"/48/steam.png
}

pkg_postinst() {
	einfo
	einfo "This package should install the necessary icons and libs for"
	einfo "x11-plugins/pidgin-opensteamworks"
	einfo "to work."
	einfo
	einfo "Icon install path: /usr/share/pixmaps/pidgin/protocols/"
	einfo "(icons for 16 and 48 will be installed)"
	einfo
	einfo "Library install path: ~/.purple/plugins/"
	einfo "(libs for x86 and x64 will be installed)"
	einfo
}
