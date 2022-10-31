#!/usr/bin/env bash

at_commands=(
'ATE1+CFUN?'
'AT+CVERSION'
'AT+CSUB'
'AT+CPIN?'
'AT+CIMI'
'AT+ICCID'
'AT+GSN'
'AT+QNWPREFCFG="mode_pref"'
'AT+QNWPREFCFG="lte_band"'
'AT+QNWPREFCFG="nsa_nr5g_band"'
'AT+QNWPREFCFG="nr5g_band"'
'AT+CGDCONT?'
'AT+QNWPREFCFG="srv_domain"'
'AT+QNWPREFCFG="ue_usage_setting"'
'AT+QNWPREFCFG="voice_domain"'
'AT+QMBNCFG="list"'
'AT+QMBNCFG="AutoSel"'
'AT+COPS?'
'AT+QENG="servingcell"'
'AT+QNWPREFCFG="policy_band"'
'AT+QNWPREFCFG="ue_capability_band"'
'AT+QNWPREFCFG="rat_acq_order"'
'AT+QNWPREFCFG="nr5g_disable_mode"'
)

for at_cmnd in ${at_commands[@]}; do
  echo "running command ${at_cmnd}:"
  echo ${at_cmnd} | atinout - /dev/ttyUSB2 -
  echo;echo
  sleep 0.4
done
