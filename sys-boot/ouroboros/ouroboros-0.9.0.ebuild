# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Initramfs init script for Kronos"
HOMEPAGE="https://git.temp.hyprlab.net/KRONOS/ouroboros"
SRC_URI="https://git.temp.hyprlab.net/KRONOS/${PN}/archive/v0.9.0.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND} >=sys-fs/lvm2-2.03.19 >=sys-apps/busybox-1.34.1-r1 >=sys-fs/cryptsetup-2.4.3-r2"
BDEPEND=""

S="${WORKDIR}/${PN}"

src_install () {
	cp "${S}/init.sh" "${D}/init" || die "Failed to copy /init"
}
