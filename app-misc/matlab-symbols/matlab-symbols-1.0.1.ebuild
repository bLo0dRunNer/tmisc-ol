# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

# needed by make_desktop_entry
inherit eutils

DESCRIPTION="Mathworks Matlab Launcher Icon"
HOMEPAGE="http://www.mathworks.com"

SRC_URI=""

LICENSE="MatLab"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror strip"

RDEPEND="sys-apps/mlocate"

src_prepare() {
	MATPATH="$(locate -n 1 MATLAB/)"
}

src_install() {

        insinto /usr/share/pixmaps/
        doins "${FILESDIR}"/matlab-icon-128.png

#	into "${MATPATH}"/bin/
#	exeinto "${MATPATH}"/bin/
#	doexe "matlab"

	dosym "${MATPATH}"/bin/matlab /usr/bin/matlab
	fperms +x /usr/bin/matlab

#	insinto /usr/share/applications/
#	doins "${FILESDIR}"/matlab-matlab.desktop

        make_desktop_entry "matlab" "MatLab" /usr/share/pixmaps/matlab-icon-128.png "Development"

}

pkg_postinst() {
	einfo
	einfo "This ebuild installs the default Matlab Icon into"
	einfo "/usr/share/pixmaps/"
	einfo
}
