#!/bin/bash
# sh $XML_ROOT/iptel/sh_iptel_test_case.sh $1 $2 $3
# $1 - sip registrar
# $2 - dial number
# $3 - number of calls to run for each test
#
# output usage if there's no argument
if [ $# -eq 0 ];
then
echo "sh $XML_ROOT/dns/att_ims_test_case.sh \$1"
echo "\$1 - number of calls to run for each test" 
exit
fi

# Test Case for WAVE IPTEL
# clear old data
SIPP_ROOT=/home/tw/sipp-3.5.1
XML_ROOT=$SIPP_ROOT/sipp_xml_scenario

cd $XML_ROOT
pwd
# remove the old log file
rm ./iptel/log/*.log

start_tim=$(date +%s)

#
# 1 ‘Call Hold’ To verify normal call hold 
echo "1 ‘Call Connect’ To verify normal call hold"
$SIPP_ROOT/sipp -sn uac $1:5060 -r 1 -rp 2s -m $3 -inf $XML_ROOT/cli_cld_number.txt -s $2 -rtp_echo -sf $XML_ROOT/uac_proxy_local_bye_immed_ans_local_hold.xml -trace_msg -message_file $XML_ROOT/iptel/iptel_test_case_1_msg.log -trace_screen -screen_file $XML_ROOT/iptel/iptel_test_case_1_screen.log
#
sleep 3
#
# 2 ‘Call Transfer’ To verify call transfer
echo "2 ‘Call Transfer’ To verify call transfer"
$SIPP_ROOT/sipp -sn uac $1:5060 -r 1 -rp 2s -m $3 -inf $XML_ROOT/cli_cld_number.txt -s $2 -rtp_echo -sf $XML_ROOT/uac_proxy_local_bye_immed_ans_local_transfer.xml -trace_msg -message_file $XML_ROOT/iptel/iptel_test_case_2_msg.log -trace_screen -screen_file $XML_ROOT/iptel/iptel_test_case_2_screen.log
#
sleep 3
#
# 3 ‘Call Answer’ To verify normal call answer
echo "3 ‘Call Answer’ To verify normal call answer"
$SIPP_ROOT/sipp -sn uac $1:5060 -r 1 -rp 2s -m $3 -inf $XML_ROOT/cli_cld_number.txt -s $2 -rtp_echo -sf $XML_ROOT/uac_proxy_local_bye_immed_ans.xml -trace_msg -message_file $XML_ROOT/iptel/iptel_test_case_3_msg.log -trace_screen -screen_file $XML_ROOT/iptel/iptel_test_case_3_screen.log
#
#
# move all log file to log directory
mv $XML_ROOT/iptel/*.log $XML_ROOT/iptel/log

perl $XML_ROOT/iptel/perl_script/verify_iptel_test_case_1.pl $XML_ROOT/iptel/log/iptel_test_case_1_screen.log $3
perl $XML_ROOT/iptel/perl_script/verify_iptel_test_case_1.pl $XML_ROOT/iptel/log/iptel_test_case_2_screen.log $3
perl $XML_ROOT/iptel/perl_script/verify_iptel_test_case_1.pl $XML_ROOT/iptel/log/iptel_test_case_3_screen.log $3

end_tim=$(date +%s)

diff_tim=$(($end_tim - $start_tim))

echo "Time of execution $diff_tim seconds"
