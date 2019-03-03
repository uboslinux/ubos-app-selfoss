#!/usr/bin/perl
#
# Initialize freshly installed selfoss. Only invoke from ubos-manifest.json.
#
# Copyright (C) 2014 and later, Indie Computing Corp. All rights reserved. License: see package.
#

use strict;

use UBOS::Logging;
use UBOS::Utils;

if( 'install' eq $operation || 'upgrade' eq $operation ) {
    my $dir  = $config->getResolve( 'appconfig.apache2.dir' );
    my $user = $config->getResolve( 'apache2.uname' );

    my $cmd = "cd '$dir' && sudo -u $user php index.php";
    my $out = '';
    my $err = '';

    if( UBOS::Utils::myexec( $cmd, undef, \$out, \$err ) != 0 ) {
        error( 'Initializing selfoss failed:', $err );
    }
}

1;
