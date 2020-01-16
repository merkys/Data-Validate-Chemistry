package Data::Validate::Chemistry;

use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw( is_CAS_number );

sub is_CAS_number
{
    my( $CAS_number ) = shift;

    return unless $CAS_number =~ /^[0-9]{2,7}-[0-9]{2}-[0-9]$/;

    my @digits = $CAS_number =~ /([0-9])/g;
    my $checksum = pop @digits;

    my $checksum_now = 0;
    for (1..@digits) {
        $checksum_now = ($checksum_now + $digits[-$_] * $_) % 10;
    }
    return $checksum == $checksum_now;
}

1;