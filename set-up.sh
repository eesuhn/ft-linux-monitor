#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NC=$(tput sgr0)

if grep -q "alias lm" $HOME/.bashrc; then
	cat <<EOF
   ___     ___
  /\\__\\   /\\__\\
 /:/  /  /::L_L_
/:/__/  /:/L:\\__\\
\\:\\  \\  \\/_/:/  /
 \\:\\__\\   /:/  /
  \\/__/   \\/__/  v2.0
${RED}Error${NC}: alias lm already exists in .bashrc
EOF
	return 1
fi

cat <<EOF >> $HOME/.bashrc

# Linux Monitor
alias lm='bash $HOME/.ft-linux-monitor/monitoring.sh'
EOF

source $HOME/.bashrc
cat <<EOF
   ___     ___
  /\\__\\   /\\__\\
 /:/  /  /::L_L_
/:/__/  /:/L:\\__\\
\\:\\  \\  \\/_/:/  /
 \\:\\__\\   /:/  /
  \\/__/   \\/__/  v2.0
${GREEN}Success${NC}: alias lm added to .bashrc
EOF
return 0
