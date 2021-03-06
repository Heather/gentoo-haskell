# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Extras for the \\"
HOMEPAGE="https://github.com/nikita-volkov/contravariant-extras"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/base-prelude-0.1.19:=[profile?] <dev-haskell/base-prelude-2:=[profile?]
	>=dev-haskell/contravariant-1.3:=[profile?] <dev-haskell/contravariant-2:=[profile?]
	>=dev-haskell/semigroups-0.8.4:=[profile?] <dev-haskell/semigroups-1:=[profile?]
	>=dev-haskell/tuple-th-0.2.5:=[profile?] <dev-haskell/tuple-th-0.3:=[profile?]
	>=dev-lang/ghc-7.6.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
"

src_prepare() {
	default

	cabal_chdeps \
		'base >= 4 && < 4.12' 'base >= 4'
}
