######## INSTALL ########

# Set the base image
FROM ubuntu:20.04

ARG PUID=1000

# Set environment variables
ENV USER steam
ENV HOMEDIR "/home/${USER}"
ENV HOME "${HOMEDIR}"
ENV STEAMCMDDIR "${HOMEDIR}/.steam/steamcmd"

# Set working directory
WORKDIR $HOME

# Insert Steam prompt answers
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo steam steam/question select "I AGREE" | debconf-set-selections \
 && echo steam steam/license note '' | debconf-set-selections

# Update the repository and install SteamCMD
ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*

RUN add-apt-repository multiverse \
	&& dpkg --add-architecture i386 \
	&& apt-get update -y \
	&& apt-get install -y --no-install-recommends ca-certificates locales lib32gcc-s1 steamcmd \
	&& rm -rf /var/lib/apt/lists/*

# Add unicode support
RUN locale-gen en_US.UTF-8
ENV LANG 'en_US.UTF-8'
ENV LANGUAGE 'en_US:en'

RUN set -x \
	# Create unprivileged user
	&& useradd -u "${PUID}" -m "${USER}" \
	# folder right
	&& chown "${USER}:${USER}" "${HOME}" \ 
	# Download SteamCMD, execute as user
	&& su "${USER}" -c \
		"steamcmd +quit \
		&& mkdir -p \"${HOMEDIR}/.steam/sdk32\" \
		&& ln -s \"${STEAMCMDDIR}/linux32/steamclient.so\" \"${HOMEDIR}/.steam/sdk32/steamclient.so\" \
		&& ln -s \"${STEAMCMDDIR}/linux32/steamcmd\" \"${STEAMCMDDIR}/linux32/steam\" \
		# 64
		&& mkdir -p \"${HOMEDIR}/.steam/sdk64\" \
		&& ln -s \"${STEAMCMDDIR}/linux64/steamclient.so\" \"${HOMEDIR}/.steam/sdk64/steamclient.so\" \
		&& ln -s \"${STEAMCMDDIR}/linux64/steamcmd\" \"${STEAMCMDDIR}/linux64/steam\"" \
	# Symlink steamclient.so; So misconfigured dedicated servers can find it
	&& ln -s "${STEAMCMDDIR}/linux64/steamclient.so" "/usr/lib/x86_64-linux-gnu/steamclient.so"
	
#WORKDIR ${STEAMCMDDIR}

# Switch to user
USER ${USER}