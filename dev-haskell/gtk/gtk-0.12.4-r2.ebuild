# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.9999

GTK_MAJ_VER="2"

#nocabaldep is for the fancy cabal-detection feature at build-time
CABAL_FEATURES="lib profile haddock hoogle hscolour nocabaldep"
inherit haskell-cabal

DESCRIPTION="Binding to the Gtk+ graphical user interface library."
HOMEPAGE="http://projects.haskell.org/gtk2hs/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="${GTK_MAJ_VER}/${PV}"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="+gio"

RDEPEND=">=dev-haskell/cairo-0.12.0:${GTK_MAJ_VER}=[profile?]
		<dev-haskell/cairo-0.12.5.0:${GTK_MAJ_VER}=[profile?]
		>=dev-haskell/gio-0.12.0:${GTK_MAJ_VER}=[profile?]
		<dev-haskell/gio-0.12.5.0:${GTK_MAJ_VER}=[profile?]
		>=dev-haskell/glib-0.12.0:${GTK_MAJ_VER}=[profile?]
		<dev-haskell/glib-0.12.5.0:${GTK_MAJ_VER}=[profile?]
		dev-haskell/mtl:=[profile?]
		>=dev-haskell/pango-0.12.0:${GTK_MAJ_VER}=[profile?]
		<dev-haskell/pango-0.12.5.0:${GTK_MAJ_VER}=[profile?]
		>=dev-lang/ghc-6.10.4:=
		dev-libs/glib:2
		x11-libs/gtk+:${GTK_MAJ_VER}
		gio? ( >=dev-haskell/gio-0.12.0:${GTK_MAJ_VER}[profile?]
			   <dev-haskell/gio-0.12.5.0:${GTK_MAJ_VER}[profile?] )"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		>=dev-haskell/gtk2hs-buildtools-0.12.4:${GTK_MAJ_VER}=
		<dev-haskell/gtk2hs-buildtools-0.12.5.0:${GTK_MAJ_VER}=
		virtual/pkgconfig"

src_prepare() {
	sed -e "s@gtk2hsTypeGen@gtk2hsTypeGen${GTK_MAJ_VER}@" \
		-e "s@gtk2hsHookGenerator@gtk2hsHookGenerator${GTK_MAJ_VER}@" \
		-e "s@gtk2hsC2hs@gtk2hsC2hs${GTK_MAJ_VER}@" \
		-i "${S}/Gtk2HsSetup.hs" \
		|| die "Could not change Gtk2HsSetup.hs for GTK+ slot ${GTK_MAJ_VER}"
	sed -e "s@gtk2hsC2hs@gtk2hsC2hs${GTK_MAJ_VER}@" \
		-e "s@gtk2hsTypeGen@gtk2hsTypeGen${GTK_MAJ_VER}@" \
		-e "s@gtk2hsHookGenerator@gtk2hsHookGenerator${GTK_MAJ_VER}@" \
		-i "${S}/${PN}.cabal" \
		|| die "Could not change ${PN}.cabal for GTK+ slot ${GTK_MAJ_VER}"
	cabal_chdeps \
		'glib  >= 0.12.0 && < 0.13' 'glib  >= 0.12.0 && < 0.12.5.0' \
		'pango >= 0.12.0 && < 0.13' 'pango >= 0.12.0 && < 0.12.5.0' \
		'cairo >= 0.12.0 && < 0.13' 'cairo >= 0.12.0 && < 0.12.5.0' \
		'gio >= 0.12.0 && < 0.13' 'gio >= 0.12.0 && < 0.12.5.0'
}

src_configure() {
	# Upstream has this enabled, so we might as well force it enabled to be sure.
	cabal_src_configure \
		--flags=deprecated \
		$(cabal_flag gio have-gio)
}
