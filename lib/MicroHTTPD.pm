use strict;
use warnings;
use 5.014;

package MicroHTTPD {

  use FFI::Platypus ();
  use FFI::CheckLib ();
  use constant {
  
    # MHD_FLAG
    _NO_FLAG                         => 0,
    _USE_DEBUG                       => 1,
    _USE_SSL                         => 2,
    _USE_THREAD_PER_CONNECTION       => 4,
    _USE_SELECT_INTERNALLY           => 8,
    _USE_IPv6                        => 16,
    _USE_PEDANTIC_CHECKS             => 32,
    _USE_POLL                        => 64,
    _USE_POLL_INTERNALLY             => 8 | 64,
    _SUPRESS_DATE_NO_CLOCK           => 128,
    _USE_NO_LISTEN_SOCKET            => 256,
    _USE_EPOLL_LINUX_ONLY            => 512,
    _USE_EPOLL_INTERNALLY_LINUX_ONLY => 8 | 512,
    _USE_PIPE_FOR_SHUTDOWN           => 1024,
    _USE_DUAL_STACK                  => 16 | 2048,
    _USE_EPOLL_TURBO                 => 4096,
    _USE_SUSPEND_RESUME              => 8192 | 1024,
    _USE_TCP_FASTOPEN                => 16384,
  };

# ABSTRACT: Interface to GNU libmicrohttpd
# VERSION

  my $ffi = FFI::Platypus->new(lib => FFI::CheckLib::find_lib_or_die( lib => 'microhttpd' ));

=head1 FUNCTIONS

=head2 start_daemon

=cut

  sub start_daemon {
    my($port) = @_;
  
    my $function = $ffi->function('MHD_start_daemon' => [
      'uint',                      # flags
      'uint16',                    # port
      'MHD_AcceptPolicyCallback',  # apc
      'opaque',                    # apc_cls,
      'MHD_AccessHandlerCallback', # dh
      'opaque',                    # dh_cls
      'int',
    ] => 'opaque' => '');
    
  }

  package MicroHTTPD::Daemon {
  }

=head2 get_version

Returns the version of libmicrohttpd in use.

=cut
  
  $ffi->attach( [MHD_get_version => 'get_version'] => [] => string => '' );

}

1;
