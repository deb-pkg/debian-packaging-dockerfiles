# Use the official Debian image as the base image
FROM debian:bookworm AS debian-dev

# Update the package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y build-essential devscripts dpkg-dev \
    lintian lintian-brush piuparts diffoscope duck adequate i18nspector cme licensecheck blhc \
    debhelper dh-make dupload dput reportbug autotools-dev dpkg-repack alien dpkg-dev-el \
    dpkg-cross debian-policy doc-debian developers-reference maint-guide packaging-tutorial how-can-i-help docbook-xml debiandoc-sgml debian-keyring debian-el \
    autopkgtest debootstrap sbuild git-buildpackage equivs mc vim nano

# Set non-root user and group
ARG USERNAME=debian
ARG USER_UID=1000
ARG USER_GID=1000

# Create a non-root user and add to sbuild group
RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    adduser "$USERNAME" sbuild

# Install sudo and grant user sudo privileges without a password prompt
RUN apt-get update && \
    apt-get install -y sudo && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

# Set the non-root user as the default user for the container
USER $USERNAME

# Add environment variables to the user's shell profile
ENV DEBEMAIL=$EMAIL DEBFULLNAME=$FULLNAME
RUN git config --global user.name "$EMAIL" && \
    git config --global user.email "$FULLNAME"

# Add mc.sh initialization and quilt alias to bash
RUN echo 'if [ -f /usr/lib/mc/mc.sh ]; then . /usr/lib/mc/mc.sh; fi' >> /home/$USERNAME/.bashrc && \
    echo 'alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"' >> /home/$USERNAME/.bashrc

# Add the content for ~/.quiltrc-dpkg
COPY .quiltrc-dpkg /home/$USERNAME/.quiltrc-dpkg

# Set up configurations in ~/.devscripts
RUN echo 'DEBUILD_DPKG_BUILDPACKAGE_OPTS="-i -I -us -uc"' >> /home/$USERNAME/.devscripts && \
    echo 'DEBUILD_LINTIAN_OPTS="-i -I --show-overrides"' >> /home/$USERNAME/.devscripts && \
    echo 'DEBSIGN_KEYID="$DEBSIGN_KEYID"' >> /home/$USERNAME/.devscripts

# Create the ~/.sbuildrc configuration file
COPY .sbuildrc /home/$USERNAME/.sbuildrc

# Set the working directory to /package
WORKDIR /package

# Start an interactive shell by default
CMD ["bash"]