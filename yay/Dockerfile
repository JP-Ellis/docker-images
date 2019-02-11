FROM archlinux/base
MAINTAINER Joshua Ellis <josh@jpellis.me>

# Update Arch Linux and install base-devel
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm base-devel

# Install git

# Create a user 'build' for builds, and allow sudo to work without passwords
RUN useradd -r -g wheel build
RUN sed -i '/NOPASSWD/s/\#//' /etc/sudoers

WORKDIR /build
RUN chown -R build /build
WORKDIR /home/build
RUN chown -R build /home/build

# Install dependencies for yay and this docker image
RUN pacman -Sy --noconfirm pacman-contrib git go

USER build

# Build and install cower
WORKDIR /build
RUN git clone https://aur.archlinux.org/yay.git
WORKDIR /build/yay
RUN makepkg --noconfirm -i

# Fix the default PACAUR settings
USER root

RUN sed -i '1iServer = https://mirror.aarnet.edu.au/pub/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
RUN sed -i '1iServer = http://ftp.swin.edu.au/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
RUN sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf
RUN sed -i 's/xz -c -z -/xz -c -T0 -z -/' /etc/makepkg.conf
ENV AURDEST /build

# Cleanup
WORKDIR /usr/bin/
COPY cleanup-build .
RUN chmod +x /usr/bin/cleanup-build
RUN cleanup-build
