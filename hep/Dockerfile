FROM jp-ellis/yay
MAINTAINER Joshua Ellis <josh@jpellis.me>

USER build

# openblas-lapack is installed first to provide blas
RUN yay -Sy --noconfirm --asdeps openblas-lapack cfitsio cern-vdt mariadb-libs openssl postgresql-libs sqlite tcsh unuran vc libxml2 xrootd gcc-fortran
  RUN yay -S --noconfirm root pythia8 checkmate fastjet hepmc lhapdf madgraph

# Cleanup
USER root
RUN cleanup-build
