# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Abstraction over creating network connections with SOCKS5 and TLS"
HOMEPAGE="https://github.com/glguy/irc-core"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/hsopenssl-0.11.2.3:=[profile?] <dev-haskell/hsopenssl-0.12:=[profile?]
	>=dev-haskell/hsopenssl-x509-system-0.1:=[profile?] <dev-haskell/hsopenssl-x509-system-0.2:=[profile?]
	>=dev-haskell/network-2.6:=[profile?] <dev-haskell/network-2.7:=[profile?]
	>=dev-haskell/socks-0.5:=[profile?] <dev-haskell/socks-0.6:=[profile?]
	>=dev-lang/ghc-8.0.1:=
	dev-libs/openssl:0=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24.0.0
"

src_prepare() {
	default

	cabal_chdeps \
		'base                  >=4.9  && <4.11' 'base                  >=4.9'
}
