#!/usr/bin/env perl

# Example:
# perl dataPro.pl /home/domicor/Documents/code/compiled/examples_for_lmps/ex02_elastic/log.lammps
# And the output file will be: log.lammps.plOutput

use strict;
use warnings;


open (rawData, "$ARGV[0]") || die "couldn't open the file!";
open (processedData,">$ARGV[0].plOutput");

while (my $record = <rawData>) {
  if ($record =~ /^\s*(-\d+\.\d+\s*){3}$/){
    print processedData "$1";# /^\s*(-\d+\.\d+\s*){3}$/
  }
}

close(rawData);
close(processedData);
