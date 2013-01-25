# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Daemon to get the FN Keys of Samsung Laptops to work"
HOMEPAGE="https://github.com/bLo0dRunNer/tmisc-ol/"


SRC_URI=""

LICENSE="Samsung"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror strip"

RDEPEND="
	app-laptop/samsung-tools
	app-laptop/easy-slow-down-manager
	"

src_install() {
        insinto /usr/sbin/
        doins "${FILESDIR}"/samsung_fn_keys.sh
	fperms +x /usr/sbin/samsung_fn_keys.sh

	newinitd "${FILESDIR}/initFNKeys.rc" samsungFNkeysd
}

pkg_postinst() {
	einfo
	einfo "This ebuild installs a daemon to get the function keys on"
	einfo "Samsung notebooks working."
	einfo
	einfo "Tested and working for: Samsung R505 Aura"
	einfo
	"${ROOT}"/etc/init.d/samsungFNkeysd stop
	"${ROOT}"/etc/init.d/samsungFNkeysd start
	einfo
	einfo "To automatically start this daemon execute the following command:"
	einfo
	einfo "rc-update add samsungFNkeysd default"
	einfo
}
