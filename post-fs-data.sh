#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}
# This script will be executed in post-fs-data mode

CONFIG="/data/data/com.oplus.games/shared_prefs/com.oplus.games_cloud_control.xml"
if ! /system/bin/grep -q umamusume "$CONFIG"; then
/system/bin/sed -i -e '/gpa_game_list/ s/<\/string>/,jp.co.cygames.umamusume,net.wargaming.wot.blitz<\/string>/' $CONFIG
/system/bin/sed -i -e '/optimise_power_game_list/ s/<\/string>/,com.miHoYo.GenshinImpact,jp.co.cygames.umamusume,net.wargaming.wot.blitz<\/string>/' $CONFIG
/system/bin/sed -i -e '/frame_insert_game_list/ s/<\/string>/,com.miHoYo.GenshinImpact,jp.co.cygames.umamusume,net.wargaming.wot.blitz<\/string>/' $CONFIG
/system/bin/sed -i -e '/increase_fps_game_list/ s/<\/string>/,com.miHoYo.GenshinImpact,jp.co.cygames.umamusume,net.wargaming.wot.blitz<\/string>/' $CONFIG
fi

mount -o bind ${MODDIR}/system/oplus_vrr_config.json /my_product/etc/oplus_vrr_config.json

cp -a ${MODDIR}/system/multimedia_pixelworks_game_apps.xml /data/system/multimedia_pixelworks_game_apps.xml
chown system.system /data/system/multimedia_pixelworks_game_apps.xml