_pkgname="gcc-linaro"
pkgname="${_pkgname}-${_target}-bin"
pkgver="${_gccver}.${_reldate}"
pkgrel=1
pkgdesc="Linaro Binary Toolchain - cross compiler for ${_target} target"
arch=(i686 x86_64)
url="https://releases.linaro.org/components/toolchain/binaries/${_relver}-${_reldate}/"
license=(GPL LGPL FDL)
provides=("${_target}-binutils" "${_target}-gcc" "${_target}-gdb" "${_target}-glibc")
conflicts=("${_target}-binutils" "${_target}-gcc" "${_target}-gdb" "${_target}-glibc")
options=(!strip staticlibs)
source=(
    "${pkgname}-${pkgver}.tar.xz::https://releases.linaro.org/components/toolchain/binaries/${_relver}-${_reldate}/${_target}/${_pkgname}-${_gccver}-${_reldate}-${CARCH}_${_target}.tar.xz"
)
noextract=(
    "${pkgname}-${pkgver}.tar.xz"
)
sha256sums=(
    "${_sha256sum}"
)

package() {
    mkdir -p "${pkgdir}/usr"
    cd "${pkgdir}/usr"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.xz" --strip-components=1 \
        --include "*/${_target}" \
        --include "*/${_target}-*"
}
