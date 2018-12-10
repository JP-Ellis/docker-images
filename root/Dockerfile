FROM local/yay
MAINTAINER Joshua Ellis <josh@jpellis.me>

USER build
RUN yay -Sy --noconfirm --asdeps openblas-lapack
RUN yay -Sy --noconfirm --asdeps fcgi go ocaml python-numpy tcsh z3
# Unfortunately, libafterimage and unuran don't install nicely.  We still try but resort to makepkg if/when they fail
RUN yay -Sy --noconfirm --asdeps libafterimage' ; su build -c 'cd /build/libafterimage; makepkg -fi
RUN yay -Sy --noconfirm --asdeps unuran' || su build -c 'cd /build/unuran; makepkg -i
RUN yay -S --noconfirm root

# Cleanup
USER root
WORKDIR /
RUN paccache -r -k0
RUN yay -Scc --noconfirm && yay -Yc --noconfirm
RUN rm -rf /build/*
RUN rm -rf /tmp/*
RUN rm -rf /usr/share/man/*
RUN rm -rf /var/tmp/*
