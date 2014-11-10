#!/usr/bin/env perl

# Example:
# perl changeSlots.pl /home/domicor/Documents/code/compiled/LammpsRelated/ui_QtGUI_main1.py
# And the output file will be: log.lammps.plOutput

# This script is used for automatic modification of the output .py file. Still under development.
use strict;
use warnings;


open (rawData, "$ARGV[0]") || die "couldn't open the file!";
open (processedData,">$ARGV[0].plOutput");

while (my $record = <rawData>) {
    $record =~ s/\s*connect\(self\.pushButton\_AtomEyePath/        QtCore.QObject.connect(self.pushButton_AtomEyePath, QtCore.SIGNAL(_fromUtf8("clicked()")), self.lineEdit_AtomEyePath.update)/
    print processedData $record;
}

close(rawData);
close(processedData);
