#!/usr/bin/env bash

echo "timestamp,lat,lon,cell_type,state,technology,duplex_mode,mcc,mnc,cellid,pcid,tac,arfcn,band,ns_dl_bw,rsrp,rsrq,sinr,scs,srxlev"
while true; do
  # time in nanoseconds:
  timestamp=$(($(date +%s%N)/1000000))
  date=$(date)
  # modem signal stength and other params
  modem_pars="`echo 'AT+QENG="servingcell"' | atinout - /dev/ttyUSB2 - | grep '+QENG:'`"
  if [ "${modem_pars}" == "" ] ; then
	  continue
  fi
  # lat lon position from gps
  lat_lon="`gpspipe -w -n 8 | grep TPV | grep -om1 "[-]\?[[:digit:]]\{1,3\}\.[[:digit:]]\{9\}" | tr '\n' ','`"

  # print out all params separated by comma's
  echo "${timestamp},${lat_lon}${modem_pars}"
  sleep 0.1
done
