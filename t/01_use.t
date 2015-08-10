use strict;
use warnings;
use 5.014;
use Test::More tests => 1;

use_ok 'MicroHTTPD';

diag '';
diag '';
diag '';

my $version = eval { MicroHTTPD::get_version() } // 'unknown';
diag "version = $version";

diag '';
diag '';
