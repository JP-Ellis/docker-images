FROM local/yay
MAINTAINER Joshua Ellis <josh@jpellis.me>

USER build
RUN yay -Sy --noconfirm --asdeps fastjet hepmc lhapdf
RUN yay -S --noconfirm pythia

# Cleanup
USER root
WORKDIR /
RUN paccache -r -k0
RUN yay -Scc --noconfirm && yay -Yc --noconfirm
RUN rm -rf /build/*
RUN rm -rf /tmp/*
RUN rm -rf /usr/share/man/*
RUN rm -rf /var/tmp/*
