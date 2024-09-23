#! /bin/bash

# Get list of drm devices
IFS=$'\n'
CARDS=$(ls -la /sys/class/drm/renderD*/device/driver 2>/dev/null | awk '{print $11}' | awk -F/ '{print $NF}')
if [ -z "$CARDS" ]; then
  echo '{}'
  exit 0
fi
for CARD in ${CARDS}; do
  LAST_CARD=${CARD}
done

# Add them to the json string
JSON='{'
COUNTER=0
for CARD in $CARDS; do
  JSON="${JSON}\"/dev/dri/card$COUNTER\":\"${CARD^^}\""
  if [ ${CARD} == ${LAST_CARD} ]; then
    JSON="${JSON}}"
  else
    JSON="${JSON},"
  fi
  COUNTER=$(( COUNTER + 1 ))
done

# Print json string
echo $JSON
