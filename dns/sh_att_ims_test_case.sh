#!/bin/bash
# sh sh_$XML_ROOT/dns/att_ims_test_case.sh $1
# $1 - number of calls to run for each test
#
# output usage if there's no argument
if [ $# -eq 0 ];
then
echo "sh sh_$XML_ROOT/dns/att_ims_test_case.sh \$1"
echo "\$1 - number of calls to run for each test" 
exit
fi

# Test Case for ATT IMS
# clear old data
SIPP_ROOT=/home/twong/sipp.svn
XML_ROOT=$SIPP_ROOT/xml_scenario

cd $XML_ROOT
pwd
# remove the old log file
rm ./dns/log/*.log

start_tim=$(date +%s)

#
# 7.1 ‘Silent Disconnect’ To verify that ZOOVE silent disconnect when **6321 dialed
echo "7.1 Silent Disconnect To verify that ZOOVE silent disconnect when **6321 dialed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.1 -inf $XML_ROOT/cli_cld_number.txt -s **6321 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.1
#
# 7.2 ‘Not Found’ To verify that ZOOVE responds with "Not Found" when **6322 is dialed
echo "7.2 Not Found To verify that ZOOVE responds with "Not Found" when **6322 is dialed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.2 -inf $XML_ROOT/cli_cld_number.txt -s **6322 -rtp_echo -sf $XML_ROOT/dns/uac_not_found_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.2
#
# 7.3 ‘Redirected‘ To verify that ZOOVE responds with "Redirected" when **6323 is dialed 
echo "7.3 Redirected To verify that ZOOVE responds with "Redirected" when **6323 is dialed" 
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.3 -inf $XML_ROOT/cli_cld_number.txt -s **6323 -rtp_echo -sf $XML_ROOT/dns/uac_redirect_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.3
#
# 7.4 ‘No-Answer Timer Expired’ To verify that ZOOVE can handle 'no-answer timer expired" call flow when  **6324 is dialed
echo "7.4 No-Answer Timer Expired To verify that ZOOVE can handle "no-answer timer expired" call flow when  **6324 is dialed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.4 -inf $XML_ROOT/cli_cld_number.txt -s **6324 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_cancel_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.4
#
# 7.5 ‘Zoove Error Announcement playing’ To verify that ZOOVE MS can play announcement as early media when **6325 dialed
echo "7.5 Zoove Error Announcement playing’ To verify that ZOOVE MS can play announcement as early media when **6325 dialed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.5 -inf $XML_ROOT/cli_cld_number.txt -rtp_echo -s **6325 -sf $XML_ROOT/dns/uac_proxy_183_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.5
#
# 7.6 ‘Zoove Error’ To verify that ZOOVE return 504 when **6326 is dialed
echo "7.6 ‘Zoove Error’ To verify that ZOOVE return 504 when **6326 is dialed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.6 -inf $XML_ROOT/cli_cld_number.txt -s **6326 -rtp_echo -sf $XML_ROOT/dns/uac_not_found_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.6
#
# 7.7 ‘Route to Call Center after Collecting Digits’ To verify that ZOOVE can route call to IVR when **6327 dialed and caller dialed digits 1, sent per RFC2833, after hearing announcement 
echo "7.7 ‘Route to Call Center after Collecting Digits’ To verify that ZOOVE can route call to IVR when **6327 dialed and caller dialed digits 1, sent per RFC2833, after hearing announcement"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.7 -inf $XML_ROOT/cli_cld_number.txt -s **6327 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_dtmf_1_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.7
#
# To verify that ZOOVE MS can play announcement when **6328 dialed
echo "To verify that ZOOVE MS can play announcement when **6328 dialed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.8 -inf $XML_ROOT/cli_cld_number.txt -s **6328 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.8
#
# To verify that ZOOVE can route call to IVR when **6329 dialed and press 2 to hear play back of digit pressed
echo "To verify that ZOOVE can route call to IVR when **6329 dialed and press 2 to hear play back of digit pressed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.9 -inf $XML_ROOT/cli_cld_number.txt -s **6329 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_dtmf_2_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.9
#
# To verify that ZOOVE MS can play announcement with AMR NB {4.75, 5.9, 7.95, and 12.2} when **63210 dialed
echo "To verify that ZOOVE MS can play announcement with AMR NB {4.75, 5.9, 7.95, and 12.2} when **63210 dialed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.10 -inf $XML_ROOT/cli_cld_number.txt -s **63210 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_amr_mode_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.10
#
# To verify that ZOOVE MS can play announcement with AMR NB no mode set when **63210 dialed
echo "To verify that ZOOVE MS can play announcement with AMR NB no mode set when **63210 dialed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.11 -inf $XML_ROOT/cli_cld_number.txt -s **63210 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.11
#
# To verify that ZOOVE MS can play announcement with G711 when **6328 dialed
echo "To verify that ZOOVE MS can play announcement with G711 when **6328 dialed"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 15000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.12 -inf $XML_ROOT/cli_cld_number.txt -s **6328 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.12
#
# To verify no issue when subscriber hangs up prior to hear any announcement after dial **6328
echo "To verify no issue when subscriber hangs up prior to hear any announcement after dial **6328"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 0 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.13 -inf $XML_ROOT/cli_cld_number.txt -s **6328 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_local_bye_immed_ans_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.13
#
# To verify no issue when subscriber hangs up in the middle of hearing announcement after dial **6328
echo "To verify no issue when subscriber hangs up in the middle of hearing announcement after dial **6328"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -d 2000 -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.14 -inf $XML_ROOT/cli_cld_number.txt -s **6328 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_local_bye_immed_ans_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.14
#
# To verify no issue when SIP core switch sends INVITE with CallingPartyNumber in TEL URI P-Asserted-Identity
echo "To verify no issue when SIP core switch sends INVITE with CallingPartyNumber in TEL URI P-Asserted-Identity"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.16 -inf $XML_ROOT/cli_cld_number.txt -s **6328 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_teluri_pani_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.16
#
# To verify no issue when SIP core switch sends re-INVITE to put call on hold
echo "To verify no issue when SIP core switch sends re-INVITE to put call on hold"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.18 -inf $XML_ROOT/cli_cld_number.txt -s **6328 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_hold_resume_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.18
#
# To verify no issue when SIP core switch sends INVITE with CallingPartyNumber in SIP URI P-Asserted-Identity
echo "To verify no issue when SIP core switch sends INVITE with CallingPartyNumber in SIP URI P-Asserted-Identity"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.19 -inf $XML_ROOT/cli_cld_number.txt -s **6328 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_sipuri_pani_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.19
# 
# To verify no issue when SIP core switch sends INVITE with CallingPartyNumber in TEL URI From header and no P-Asserted-Identity
echo "To verify no issue when SIP core switch sends INVITE with CallingPartyNumber in TEL URI From header and no P-Asserted-Identity"
$SIPP_ROOT/sipp -sn uac -i [fd00:172:16::218] -p 5090 -bind_local [fd00:172:16::218]  [fd00:172:16::212]:5060 -r 1 -rp 2s -t t1 -m $1 -t t1 -message_file $XML_ROOT/dns/att_ims_test_case_7.20 -inf $XML_ROOT/cli_cld_number.txt -s **6321 -rtp_echo -sf $XML_ROOT/dns/uac_proxy_remote_bye_immed_ans_teluri_from_dns.xml -trace_msg -trace_screen -screen_file $XML_ROOT/dns/att_ims_test_case_7.20
#
# move all log file to log directory
mv $XML_ROOT/dns/*.log $XML_ROOT/dns/log

perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_no_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.1_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_reject.pl $XML_ROOT/dns/log/att_ims_test_case_7.2_screen.log 404 $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_reject.pl $XML_ROOT/dns/log/att_ims_test_case_7.3_screen.log 302 $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_timeout.pl $XML_ROOT/dns/log/att_ims_test_case_7.4_screen.log 487 $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.5.pl $XML_ROOT/dns/log/att_ims_test_case_7.5_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_timeout.pl $XML_ROOT/dns/log/att_ims_test_case_7.6_screen.log 504 $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.7_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.8_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.9_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.10_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.11_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.12_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_no_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.13_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.14_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.16_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.18_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.19_screen.log $1
perl $XML_ROOT/dns/perl_script/verify_att_ims_test_case_7.x_no_rtp.pl $XML_ROOT/dns/log/att_ims_test_case_7.20_screen.log $1

end_tim=$(date +%s)

diff_tim=$(($end_tim - $start_tim))

echo "Time of execution $diff_tim seconds"
