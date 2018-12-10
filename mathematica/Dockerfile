FROM local/yay
MAINTAINER Joshua Ellis <josh@jpellis.me>

USER build
WORKDIR /build
RUN git clone https://aur.archlinux.org/mathematica.git
WORKDIR /build/mathematica
RUN sed -i 's/chmod +x/# chmod +x/' PKGBUILD
RUN sed -i 's/# msg2 "Removing documentation"/msg2 "Removing documentation"/' PKGBUILD
RUN sed -i 's|# rm -rf "\${pkgdir}/opt/Mathematica/Documentation"|rm -rf "\${pkgdir}/opt/Mathematica/Documentation"|' PKGBUILD
COPY Mathematica_11.3.0_LINUX.sh .
RUN makepkg --noconfirm -si

# Cleanup
USER root
WORKDIR /
RUN rm -rf /build/*
RUN paccache -r -k0
RUN yay -Scc --noconfirm && yay -Yc --noconfirm
RUN rm -rf /tmp/*
RUN rm -rf /usr/share/man/*
RUN rm -rf /var/tmp/*
