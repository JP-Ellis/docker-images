FROM jp-ellis/yay
MAINTAINER Joshua Ellis <josh@jpellis.me>

USER build
WORKDIR /build

RUN git clone https://aur.archlinux.org/mathematica.git
WORKDIR /build/mathematica
RUN sed -i 's/chmod +x/# chmod +x/' PKGBUILD
RUN sed -i 's/# msg2 "Removing documentation"/msg2 "Removing documentation"/' PKGBUILD
RUN sed -i 's|# rm -rf "\${pkgdir}/opt/Mathematica/Documentation"|rm -rf "\${pkgdir}/opt/Mathematica/Documentation"|' PKGBUILD
COPY Mathematica_12.0.0_LINUX.sh .
RUN makepkg --noconfirm -si && \
    rm -rvf /build/*

# Cleanup
USER root
RUN cleanup-build
