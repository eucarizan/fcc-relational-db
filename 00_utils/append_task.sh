#!/bin/bash
tail -n1 /workspace/.bash_history >> task.sh
if [[ $1 ]]; then
  sed -ri "\$s/(.*)/\1 \$1/" task.sh
fi
