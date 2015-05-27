#! /usr/local/bin/perl
# perl verify_att_ims_test_case_7.5.pl arg_1 arg_2
# arg_1 screen log file name
# arg_2 number of calls for this test

$numArgs = $#ARGV + 1;

if ($numArgs < 2) {
	print "perl verify_att_ims_test_case_7.5.pl arg_1 arg_2\n";
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

$get183 = 0;
$getRtp = 0;

# read from INFILE 1 line at a time
while (<INFILE>) {

	# print the line to the output file
	@lines = split(/ /, $_);

	# check for the line	
	# 425 Total echo RTP pckts 1st stream    0.000 last period RTP rate (kB/s)
	if ($lines[5] eq 'RTP') {
		# check for the number of RTP packets echo 
		if ($lines[2] > 0) {
			$getRtp = 1;	
		}
	}
	else {
		# check for the line
		# 183 <----------         1         0         0         0
		if ($lines[9] == 183) {
			# check for number of 183 received
			if ($lines[19] == $ARGV[1]) {
				$get183 = 1;
			}
		}
		else {
			# check for the line
			# 603 <----------  E-RTD1 1         0         0         0
			if ($lines[9] == 603) {
				
				# check for number of 603 received
				# if 183 matched, and has RTP and 603 matched
				if ( ($get183 == 1) && ($getRtp == 1) && ($lines[13] == $ARGV[1])) {
					print "$ARGV[0] OK\n";
				}
				else {
					print "$ARGV[0] NG\n";
				}
			}
		}
	}
}

# close input and output file
close (INFILE);
