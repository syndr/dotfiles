#!/bin/env bash

mounts=(
    "bael.styx.ultroncore.net/syndr"
    "bael.styx.ultroncore.net/media"
    "bael.styx.ultroncore.net/public"
    )

echo Giving SMB a kick...

for mount in "${mounts[@]}"
do
    gio mount -u smb://$mount
done

echo Kicking it again...


for mount in "${mounts[@]}"
do
    gio mount smb://$mount
done

echo Should be working now.
