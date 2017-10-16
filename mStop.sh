#!/bin/bash

processid=$(ps aux | grep 'minergate-cli' | grep -v grep| awk '{print $2}')

# TODO : Check if processid is blank and assign 0

currentHour=$(date +%H)
echo "Current Hour is {$currentHour}"

if ( [ "$currentHour" -le 8 ] || [ "$currentHour" -ge 18 ] )
then
  if [ "$processid" -gt 0 ]
  then
  echo "Miner Running at process id {$processid}"
  kill $processid
  echo "Process Killed"
  else
  echo "Miner Not running....."
  fi
  #nohup minergate-cli -user user@xyz.com -xmr
else
echo "Process will not run during this time frame"
fi

#echo ${processid}
