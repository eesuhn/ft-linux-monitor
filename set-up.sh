#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NC=$(tput sgr0)

if grep -q "alias lm" /home/$USER/.bashrc; then
	printf "${RED}Error${NC}: alias lm already exists in .bashrc\n"
	return 1
fi

cat <<EOF >> /home/$USER/.bashrc

# Linux Monitor
alias lm='bash /home/$USER/.linux-monitor/monitoring.sh'
EOF

source /home/$USER/.bashrc
printf "${GREEN}Success${NC}: alias lm added to .bashrc\n"
return 0
