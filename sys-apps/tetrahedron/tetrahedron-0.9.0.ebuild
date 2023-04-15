# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
anstream-0.2.6
anstyle-0.3.5
anstyle-parse-0.1.1
anstyle-wincon-0.2.0
bitflags-1.3.2
cc-1.0.79
clap-4.2.1
clap_builder-4.2.1
clap_derive-4.2.0
clap_lex-0.4.1
concolor-override-1.0.0
concolor-query-0.3.3
errno-0.3.1
errno-dragonfly-0.1.2
heck-0.4.1
hermit-abi-0.3.1
io-lifetimes-1.0.10
is-terminal-0.4.7
libc-0.2.141
linux-raw-sys-0.3.1
once_cell-1.17.1
proc-macro2-1.0.56
quote-1.0.26
rustix-0.37.11
strsim-0.10.0
syn-2.0.14
unicode-ident-1.0.8
utf8parse-0.2.1
windows-sys-0.45.0
windows-sys-0.48.0
windows-targets-0.42.2
windows-targets-0.48.0
windows_aarch64_gnullvm-0.42.2
windows_aarch64_gnullvm-0.48.0
windows_aarch64_msvc-0.42.2
windows_aarch64_msvc-0.48.0
windows_i686_gnu-0.42.2
windows_i686_gnu-0.48.0
windows_i686_msvc-0.42.2
windows_i686_msvc-0.48.0
windows_x86_64_gnu-0.42.2
windows_x86_64_gnu-0.48.0
windows_x86_64_gnullvm-0.42.2
windows_x86_64_gnullvm-0.48.0
windows_x86_64_msvc-0.42.2
windows_x86_64_msvc-0.48.0
"

declare -A GIT_CRATES=(
        [noshell]="https://git.temp.hyprlab.net/Kaa/noshell"
)

DESCRIPTION="Initramfs builder for KronOS"
HOMEPAGE="https://git.temp.hyprlab.net/KRONOS/tetrahedron"

inherit cargo
SRC_URI="$(cargo_crate_uris) https://git.temp.hyprlab.net/KRONOS/tetrahedron/archive/v0.9.1.tar.gz https://git.temp.hyprlab.net/Kaa/noshell/archive/v0.9.2.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-lang/rust-bin-1.66.1-r1"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"

cargo_src_compile () {
	ln -sf "${WORKDIR}/noshell" "${WORKDIR}/noshell-"
	#sed -i -e "s|noshell = .*|noshell = { path = \"${WORKDIR}/noshell\" }|g" Cargo.toml
	cargo build --release || die "Cargo build release failed"
}
