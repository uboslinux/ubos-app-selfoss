#!/usr/bin/perl
#
# Simple test for selfoss
#
# Copyright (C) 2014 and later, Indie Computing Corp. All rights reserved. License: see package.
#

use strict;
use warnings;

package Selfoss1Test;

use UBOS::WebAppTest;

# The states and transitions for this test

my $TEST = new UBOS::WebAppTest(
    appToTest => 'selfoss',

    checks => [
            new UBOS::WebAppTest::StateCheck(
                    name  => 'virgin',
                    check => sub {
                        my $c = shift;

                        $c->getMustStatus( '/', 200, 'Wrong status' );
                    }
            )
    ]
);

$TEST;
