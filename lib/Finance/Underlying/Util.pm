package Finance::Underlying::Util;

use strict;
use warnings;

use base qw( Exporter );
our @EXPORT_OK = qw( inverse_frx_symbol );

=head1 NAME

Finance::Underlying::Util

=cut

## VERSION

=head1 SYNOPSIS

use Finance::Underlying::Util qw(inverse_frx_symbol);
...

=head1 EXPORT

    inverse_frx_symbol

=head1 SUBROUTINES/METHODS

=head2 inverse_frx_symbol

inverse the frx symbol using Regex
knowing that, all frx symbols follow this regular expression /^(frx)([A-Z]{3})([A-Z]{3})$/

=over 4

=item <symbol> the underlying symbol

=back

return the inverted symbol or empty string if couldn't inverse the symbol 

=cut

sub inverse_frx_symbol {
    my $symbol = shift;

    if(my ($prefix, $asset, $quoted) = $symbol =~ /^(cry|frx)([A-Z]{3})([A-Z]{3})$/) {
        my $inverted_symbol = $prefix . $quoted . $asset;
        return $inverted_symbol;
    }

    return '';
}

1;
