FROM ue4-steamenv

#Steam Game
# App id - you should put your own steam dedicated server app id
ENV STEAMAPPID 480
# Only for folder structure : default -> game (third-person-shooter for example)
ENV STEAMAPP game
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

# Copy game and utils bash 
COPY etc/entry.sh "${HOMEDIR}/entry.sh"

USER root

# Application folder
RUN set -x \
	&& mkdir -p "${STEAMAPPDIR}" \
	&& chmod 755 "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" \
	&& chown "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}"

# Switch to steam user
USER ${USER}

WORKDIR ${HOMEDIR}

CMD ["bash", "entry.sh"]

# Expose ports
EXPOSE 7777/udp \
	7778/udp \
	27165/tcp \
	27165/udp \
	21114/tcp \
	21114/udp