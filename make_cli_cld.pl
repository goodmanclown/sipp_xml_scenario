#!/usr/local/bin/perl
 use strict;
 use warnings;
  
 #open (MYFILE, '>>cli_cld_number.txt');
 open (MYFILE, '>>cli_fix_cld_number.txt');
 print MYFILE "SEQUENTIAL\n";
 print MYFILE "#field0;field1\n";

 my $range = 10000;
 my $count = 0;
 for ($count = 10000; $count >= 0; $count--) {
#   my $cli_number = int(rand($range)) + 4083960000;
   my $cli_number = 14083968314;

   print MYFILE "$cli_number;**277489\n";
 }
 close (MYFILE); 
