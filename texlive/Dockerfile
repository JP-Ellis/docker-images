FROM local/yay
MAINTAINER Joshua Ellis <josh@jpellis.me>

# Install dependencies
USER build
RUN yay -Sy --noconfirm rsync wget

# Create the build directory
RUN mkdir /build/texlive
WORKDIR /build/texlive

# Use rsync to download the repo to make installation (and future updates) faster
RUN rsync -avz --delete rsync://mirror.aarnet.edu.au/pub/CTAN/systems/texlive/tlnet/ local-mirror

# Install TeXLive with install-tl
RUN curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xz --strip-components=1
USER root
RUN ./install-tl -repository local-mirror -profile /dev/null

# Update the PATH environment, and fix repository
ENV PATH="/usr/local/texlive/2017/bin/x86_64-linux:${PATH}"
RUN tlmgr option repository ctan

# Cleanup
USER root
RUN cleanup-build
