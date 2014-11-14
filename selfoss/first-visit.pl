#!/usr/bin/perl
#
# Initialize freshly installed selfoss. Only invoke from ubos-manifest.json.
#

use strict;

use UBOS::Logging;
use UBOS::Utils;

if( 'install' eq $operation ) {
    my $url = $config->getResolve( 'site.protocol' )
            . '://'
            . $config->getResolve( 'site.hostname' )
            . $config->getResolve( 'appconfig.context' )
            . '/';

    my $cmd = 'curl'
            . " '$url'"
            . " --resolve '" . $config->getResolve( 'site.hostname' ) . ":80:127.0.0.1"
            . " --resolve '" . $config->getResolve( 'site.hostname' ) . ":443:127.0.0.1";
    
    my $out = '';
    my $err = '';

    if( UBOS::Utils::myexec( $cmd, undef, \$out, \$err ) != 0 ) {
        error( 'Initializing selfoss failed:', $err );
    }
}

1;

