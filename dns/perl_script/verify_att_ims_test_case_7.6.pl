#! /usr/local/bin/perl
# perl verify_att_ims_test_case_7.6.pl arg_1 arg_2
# arg_1 screen log file name
# arg_2 number of calls for this test

$numArgs = $#ARGV + 1;

if ($numArgs < 2) {
	print "perl verify_att_ims_test_case_7.6.pl arg_1 arg_2\n";
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

# read from INFILE 1 line at a time
while (<INFILE>) {

	# print the line to the output file
	@lines = split(/ /, $_);

	# search for the line including Logger.hxx
	if ($lines[9] == 504) {
		
		if ($lines[19] == $ARGV[1]) {
			print "$ARGV[0] OK\n";
		}
		else {
			print "$ARGV[0] NG\n";
		}
	}
}

# close input and output file
close (INFILE);
