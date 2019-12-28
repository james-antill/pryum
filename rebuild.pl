#! /usr/bin/perl -w

# Rebuild the pryum.conf files into the pryum.sh "binary"
# rebuild pryum.sh pryum30.conf pryum31.conf ...
# mv pryum.sh.new pryum.sh

use strict;
use warnings;

use Fcntl;

my %nvals;

die "Format: $0 pryum.sh pryum.conf [...]" if @ARGV < 2;

my $fname = shift @ARGV;

open(FH,  '<', $fname) || die $!;
sysopen(NFH, $fname . ".new", O_WRONLY|O_TRUNC|O_CREAT, 0755) || die $!;
my $copy = 1;
while (<FH>) {
    if (/^# END of included PKGS ----$/) {
        $copy = 1;
    }
    print NFH if $copy;
    if (/^# BEGIN of included PKGS ----$/) {
        $copy = 0;
        while (<>) {
            print NFH
        }
    }
}

close(FH) || die $!;
close(NFH) || die $!;
