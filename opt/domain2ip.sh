#!/bin/sh


SEP=';'
OUTFILE="pair_ip.l"

while read line;                                                    
do
  # ping with timing 1 sec and one shot
  str_msg=$(ping -t 1 -c 1 $line |  grep -oE "\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b" | head -n 1);


  if [[ $str_msg =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
   echo "${line};${str_msg}" >> $(OUTFILE)
  fi
  
done < target.list
