FROM jp-ellis/yay
MAINTAINER Joshua Ellis <josh@jpellis.me>

USER build

# Dependencies have to be installed in a specific order as pythia and root
# dynamically enable/disable features based on whether the dependency is
# present.  As a result, the order is:
#
# - openblas-lapack as the blas provider (instead of blas)
# - All other optional dependencies for pythia and root
# - Pythia (not that this depends on root)
# - Root (this re-installs root)

# openblas-lapack is installed first to provide blas
RUN yay -Sy --noconfirm --asdeps openblas-lapack
RUN yay -Sy --noconfirm --asdeps fastjet fcgi gcc-fortran go hepmc lhapdf ocaml python-numpy tcsh xrootd z3
RUN yay -Sy --noconfirm --asdeps pythia
# RUN yay -Sy --noconfirm --asdeps libafterimage ; su build -c cd /build/libafterimage; makepkg -fi
# RUN yay -Sy --noconfirm --asdeps unuran || su build -c cd /build/unuran; makepkg -i
RUN yay -S --noconfirm root

# Cleanup
USER root
RUN cleanup-build
