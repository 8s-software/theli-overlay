# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Generate escape sequences to customize text display properties"
HOMEPAGE="https://github.com/8s-software/tsend"
SRC_URI="https://github.com/8s-software/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	app-shells/bash-completion
	app-shells/bash
	sys-apps/util-linux
"
BDEPEND="
	dev-build/cmake
"

src_prepare() {
	ebegin "Fix cmake minimum required version"
	sed \
		-e '/cmake_minimum_required/s:2\.8:3.10:' \
		-i ${S}/CMakeLists.txt
	eend $?

	cmake_src_prepare
}
