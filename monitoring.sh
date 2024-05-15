#!/bin/bash

PURPLE=$(tput setaf 5)
NC=$(tput sgr0)

echo "${PURPLE}Starting...${NC}"

trap "tput cnorm; exit" SIGINT SIGTERM
tput civis

read BOOT_TIME BOOT_DATE <<< "$(who -b | awk '{print $4, $3}')"
TOTAL_MEM=$(awk '/MemTotal/ {printf "%.0f", ($2 / 1024)}' /proc/meminfo)

while true; do
	# CPU
	CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

	# RAM
	RAM_USED=$(awk '/MemFree/ {printf "%.0f", ($2 / 1024)}' /proc/meminfo)
	RAM_USED=$((TOTAL_MEM - RAM_USED))
	RAM_PERCENT=$((RAM_USED * 100 / TOTAL_MEM))

	clear
	cat <<EOF
${PURPLE}   ___     ___
  /\\__\\   /\\__\\
 /:/  /  /::L_L_
/:/__/  /:/L:\\__\\
\\:\\  \\  \\/_/:/  /
 \\:\\__\\   /:/  /
  \\/__/   \\/__/  ${NC}v1.0

  CPU:        $CPU_LOAD%
  Memory:     $RAM_USED/${TOTAL_MEM}MB $RAM_PERCENT%
  Last boot:  $BOOT_TIME $BOOT_DATE
EOF
	sleep 1
done
