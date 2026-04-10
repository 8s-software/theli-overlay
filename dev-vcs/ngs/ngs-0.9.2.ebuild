# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Helper for local and remote git repository of NITA"
HOMEPAGE="https://github.com/8s-software/ngs"
SRC_URI="https://github.com/8s-software/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	app-shells/bash-completion
	dev-vcs/git
	net-misc/openssh
	sys-apps/coreutils
	sys-apps/util-linux
	app-shells/bash
	app-text/c2e
"
BDEPEND="
	dev-build/cmake
"

src_prepare() {
	ebegin "Fix cmake minimum required version"
	sed \
		-e '/cmake_minimum_required/s:2\.8\.12:3.10:' \
		-i ${S}/CMakeLists.txt
	eend $?

	cmake_src_prepare
}
