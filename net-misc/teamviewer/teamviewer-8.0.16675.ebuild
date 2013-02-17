# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="the All-In-One Solution for Remote Access and Support over the Internet"
HOMEPAGE="http://www.teamviewer.com"


SRC_URI="
        x86?    ( http://www.teamviewer.com/download/version_8x/teamviewer_linux.deb )
        amd64?  ( http://www.teamviewer.com/download/version_8x/teamviewer_linux_x64.deb )
"

LICENSE="TeamViewer"
SLOT="0"
KEYWORDS="mask ~amd64 ~x86"
IUSE=""

RESTRICT="mirror strip"

RDEPEND="app-emulation/wine"


src_unpack() {
        unpack ${A}
        unpack ./data.tar.gz
        rm -f control.tar.gz data.tar.gz debian-binary
}


pkg_setup() {
	elog
        elog "This ebuild installs the TeamViewer binary and libraries and relies on"
        elog "Gentoo's wine package to run the actual program."
        elog
        elog "If you encounter any problems, consider running TeamViewer with the"
        elog "bundled wine package manually."
	elog
}

src_install() {
        insinto /opt/teamviewer8/
        doins opt/teamviewer8/tv_bin/wine/drive_c/TeamViewer/*

	insinto /opt/teamviewer8/
	doins opt/teamviewer8/tv_bin/desktop/teamviewer.png

#	insinto /usr/share/applications/
#	doins "${FILESDIR}"/teamviewer.desktop

        insinto /usr/sbin
        doins opt/teamviewer8/tv_bin/teamviewerd
        fperms +x /usr/sbin/teamviewerd

        echo "#!/bin/bash" > teamviewer || die
        echo "export WINEDLLPATH=/opt/teamviewer8" >> teamviewer || die
        echo "/usr/bin/wine /opt/teamviewer8/TeamViewer.exe" >> teamviewer || die
        insinto /usr/bin
        dobin teamviewer

        dodoc opt/teamviewer8/linux_FAQ_{EN,DE}.txt  || die
        dodoc opt/teamviewer8/CopyRights_{EN,DE}.txt || die

        make_desktop_entry "${PN}" TeamViewer /opt/teamviewer8/teamviewer.png Network

        newinitd "${FILESDIR}/teamviewerd.rc" teamviewerd
}

pkg_postinst() {
	einfo
        einfo "In order to properly work, ${PN} now needs a background daemon to be running."
        einfo "An rc script has been installed at /etc/init.d/${PN}d"
	einfo
	rc-update del teamviewerd
	"${ROOT}"/etc/init.d/teamviewerd stop
	"${ROOT}"/etc/init.d/teamviewerd start
	einfo
        einfo "To automatically start the TeamViewer daemon execute the following command:"
        einfo
        einfo "rc-update add teamviewerd default"
	einfo
}
