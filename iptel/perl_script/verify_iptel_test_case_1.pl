#! /usr/local/bin/perl
# perl verify_iptel_test_case_1.pl arg_1 arg_2
# arg_1 screen log file name
# arg_2 number of calls for this test

$numArgs = $#ARGV + 1;

if ($numArgs < 2) {
	print "perl verify_iptel_test_case_1.pl arg_1 arg_2\n";
	print "arg_1 screen log file name\n";
	print "arg_2 number of calls for this test\n";
	exit;
}

unless (-e $ARGV[0]) {
	print "$ARGV[0] does not exist\n";
	exit;
}

# open input and output file
open (INFILE, $ARGV[0]);

$get200 = 0;
$getRtp = 0;

# read from INFILE 1 line at a time
while (<INFILE>) {

	# print the line to the output file
	@lines = split(/ /, $_);

	# check for the line
	# 200 <----------  E-RTD1 1         0         0         0
	if ($lines[9] == 200) {
		# check for number of 200 INVITE received
		if ($lines[13] == $ARGV[1]) {
			$get200 = 1;
		}
	}
	else {
		# check for the line
		# BYE <----------         1         0         0         0
		if ($lines[9] eq 'BYE') {
				
			# check for number of BYE received
			# if 200 OK INVITE matched, and has RTP and BYE matched
			if ( ($get200 == 1) && ($lines[19] == $ARGV[1])) {
				print "$ARGV[0] OK\n";
			}
			else {
				print "$ARGV[0] NG\n";
			}
		}
	}
}

# close input and output file
close (INFILE);
