#!/usr/bin/env bash
echo -e "set relativenumber\nset number\nset shiftwidth=2\nset autoindent" > ~/.vimrc

# add check if exists
echo '#!/bin/bash' > append_task.sh 
echo 'tail -n1 /workspace/.bash_history >> task.sh' >> append_task.sh
echo -e "if [[ \$1 ]]; then\n  sed -ri \"\$s/(.*)/\1 \$1/\" task.sh\nfi" >> append_task.sh
chmod +x append_task.sh

echo '#!/bin/bash' > delete_last_line.sh 
echo "sed -i '$ d' task.sh" >> delete_last_line.sh
chmod +x delete_last_line.sh

echo '#!/bin/bash' > task.sh 

echo -e "\nalias dbike=\"sed -i '$ d' bike-shop.sh\"" >> ~/.bashrc
echo "alias adtask=\"./append_task.sh\"" >> ~/.bashrc

export PSQL="psql -U freecodecamp -d bikes -c"
