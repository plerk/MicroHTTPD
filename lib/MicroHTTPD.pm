use strict;
use warnings;
use 5.014;

package MicroHTTPD {

  use FFI::Platypus ();
  use FFI::CheckLib ();

# ABSTRACT: Interface to GNU libmicrohttpd
# VERSION

  my $ffi = FFI::Platypus->new(lib => FFI::CheckLib::find_lib_or_die( lib => 'microhttpd' ));

=head1 FUNCTIONS

=head2 get_version

Returns the version of libmicrohttpd in use.

=cut
  
  $ffi->attach( [MHD_get_version => 'get_version'] => [] => string => '' );

}

1;
