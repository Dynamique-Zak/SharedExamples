#!/bin/bash
echo "Loading Steam Release Branch"

bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
			+login anonymous \
			+app_update "${STEAMAPPID}" \
			+quit

# copy steam client (YourGame should be replaced by your)
cp "${STEAMCMDDIR}/linux64/steamclient.so" "${STEAMAPPDIR}/YourGame/Binaries/Linux/"

# run game (the linux SH of the LinuxServer build, YourGameServer should be replaced)
bash  "${STEAMAPPDIR}/YourGameServer.sh"