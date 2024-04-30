#!/usr/bin/env bash
if [[ ! -a append_task.sh ]]; then
  echo '#!/bin/bash' > append_task.sh 
  echo 'tail -n1 /workspace/.bash_history >> task.sh' >> append_task.sh
  echo -e "if [[ \$1 ]]; then\n  sed -ri \"\\\$s/(.*)/\1 \$1/\" task.sh\nfi" >> append_task.sh
  chmod +x append_task.sh
fi

if [[ ! -a delete_last_line.sh ]]; then
  echo '#!/bin/bash' > delete_last_line.sh 
  echo "sed -i '$ d' task.sh" >> delete_last_line.sh
  chmod +x delete_last_line.sh
fi

if [[ ! -a task.sh ]]; then
  echo '#!/bin/bash' > task.sh 
fi

if [[ ! -a upset.sh ]]; then
  echo -e "set relativenumber\nset number\nset shiftwidth=2\nset autoindent" > ~/.vimrc
  echo -e "\nalias dbike=\"sed -i '$ d' bike-shop.sh\"" >> ~/.bashrc
  echo "alias adtask=\"./append_task.sh\"" >> ~/.bashrc
  sed -i '130d' ~/.bashrc
  sed -i "130i PS1='camper: \[\033[01;34m\]/\${PWD##*/}\[\033[00m\]`__git_ps1`\[\033[0m\]\n\$ '" ~/.bashrc
  echo '#!/bin/bash' > upset.sh 
  echo "echo -e \"set relativenumber\nset number\nset shiftwidth=2\nset autoindent\" > ~/.vimrc" >> upset.sh
  echo "echo -e \"\nalias dbike=\\\"sed -i '$ d' bike-shop.sh\\\"\" >> ~/.bashrc" >> upset.sh
  echo "echo \"alias adtask=\\\"./append_task.sh\\\"\" >> ~/.bashrc" >> upset.sh
  chmod +x upset.sh
fi

export PSQL="psql -U freecodecamp -d bikes -c"

# add to bashrc line 130
# PS1='camper: \[\033[01;34m\]/${PWD##*/}\[\033[33m\]`__git_ps1`\[\033[0m\]\n\[\033[01;38;5;46m\]\$\[\033[0m\] '

