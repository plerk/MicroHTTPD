use strict;
use warnings;
use MicroHTTPD;
use Test::More tests => 1;

my $version = MicroHTTPD::get_version();

isnt $version, '', "version = $version";
