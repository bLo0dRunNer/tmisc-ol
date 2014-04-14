# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Adds ACPI events to enable working Fn-keys for brightness control on Lenovo IdeaPad G580 (20157) laptop."
HOMEPAGE="https://github.com/bLo0dRunNer/tmisc-ol/"


SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror strip"

RDEPEND="
sys-power/acpid"

pkg_setup() {

	elog
        elog "This package adds ACPI events for brightness control via"
	elog "Fn-keys, this script was tested for"
	elog "Lenovo IdeaPad G580 (20157) laptops. It depends on sys-power/acpid"
	elog "to get the key events from the Fn-keys for brigthness control"
	elog "using the acpi_listen command."
	elog

}

src_install() {

        insinto /etc/acpi/
        doins "${FILESDIR}"/etc/acpi/*.sh

        insinto /etc/acpi/events/
        doins "${FILESDIR}"/etc/acpi/events/lenovo-*

        fperms +x /etc/acpi/lenovo-*.sh

}

pkg_postinst() {

	einfo
	einfo "To get the ACPI events to work properly, you"
	einfo "have to restart the acpid service e.g. with:"
	einfo 
	einfo "[systemd]: systemctl restart acpid"
	einfo "[openrc]:  /etc/init.d/acpid restart"
	einfo
	einfo "depending on your init system"
	einfo

}
