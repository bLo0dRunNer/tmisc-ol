# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Installs Matlab Icon, launcher symbols need to be manually modified"
HOMEPAGE="http://www.mathworks.com"


SRC_URI=""

LICENSE="MatLab"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror strip"

RDEPEND="sys-apps/mlocate"

src_install() {
        insinto /usr/share/pixmaps/
        doins "${FILESDIR}"/matlab-icon-128.png
	insinto /usr/share/applications/
	doins "${FILESDIR}"/matlab-matlab.desktop
#        make_desktop_entry "${MATPATH}"/matlab "MatLab" /usr/share/pixmaps/matlab-icon-128.png "Development"
}

pkg_postinst() {
	einfo
	einfo "This ebuild installs the default Matlab Icon into"
	einfo "/usr/share/pixmaps/"
	einfo "To use this Icon you have to edit your Matlab launcher Icon"
	einfo
	einfo "A matlab-matlab.desktop file is created in /usr/share/applications/"
	einfo "You have to modify the execution command of this file to make it usable"
	einfo
}
