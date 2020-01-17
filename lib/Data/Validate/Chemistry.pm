package Data::Validate::Chemistry;

use strict;
use warnings;

# ABSTRACT: Validate common chemical identifiers
# VERSION

use Exporter 'import';
our @EXPORT_OK = qw(
    is_CAS_number
    is_European_Community_number
);

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

sub is_European_Community_number
{
    my( $EC_number ) = shift;

    return unless $EC_number =~ /^([0-9]{3}-){2}[0-9]$/;
}

1;
