#! /usr/bin/perl -w

# Reconfigure a pryum.conf file ...
# Run (roughly):
# cp BLAH /pryum.conf
# pryum redeps > abcd
# reconf abcd /pryum.conf
# mv /pryum.conf.new /pryum.conf

use strict;
use warnings;

my %nvals;

die "Format: $0 [-u] redeps-output pryum.conf" if @ARGV < 2;

my $conf_update = 0;

if ($ARGV[0] eq "-u") {
    shift @ARGV;
    $conf_update = 1;
}

open(FH, '<', $ARGV[0]) || die $!;
while (<FH>) {
    if (/"([^:"]+):([^"]*)"$/) {
        $nvals{$1} = $2
    }
}
close(FH) || die $!;

open(CONF, '<', $ARGV[1]) || die $!;
open(NCONF, '>', $ARGV[1] . ".new") || die $!;
while (<CONF>) {
    if (/"([^:"]+):([^"]*)"$/) {
        if (!exists $nvals{$1} && $conf_update) {
            print NCONF
        } elsif (!exists $nvals{$1}) {
            print NCONF "        \"$1:\"\n"
        } else {
            print NCONF "        \"$1:$nvals{$1}\"\n"
        }
    } else {
        print NCONF
    }
}
close(CONF) || die $!;
close(NCONF) || die $!;
