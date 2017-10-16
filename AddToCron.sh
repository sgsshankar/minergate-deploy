#!/bin/bash
# Function to add script to crontab
function addtocrontab () {
  local frequency=$1
  local command=$2
  local job="$frequency $command"
  cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -
}

$path_to_script_start = "~/4k/mStart.sh"
# Set Permission to executable
chmod +x $path_to_script_start

$path_to_script_stop = "~/4k/mStop.sh"

chmod +x $path_to_script_stop

# Add to crontab
addtocrontab "*/30 * * * *" $path_to_script_start
addtocrontab "*/30 * * * *" $path_to_script_stop