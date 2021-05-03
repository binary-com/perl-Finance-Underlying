use strict;
use warnings;

use Test::Most;
use Test::Warnings;
use Finance::Underlying;

subtest 'Get all synthetic indices' => sub {
    my %expected_synthetics = map { $_ => 0 } qw/1HZ100V 1HZ10V 1HZ25V 1HZ50V 1HZ75V BOOM1000 BOOM500 CRASH1000 CRASH500 JD10 JD100 JD25 JD50 JD75 RB100 RB200 RDBEAR RDBULL R_10 R_100 R_25 R_50 R_75 WLDAUD WLDEUR WLDGBP WLDGOLD WLDUSD WLDXAU stpAUDJPY stpAUDUSD stpEURCAD stpEURGBP stpEURUSD stpRNG stpUSDCAD stpUSDJPY lala/;

    $expected_synthetics{$_} = 1 for map { $_->{symbol} } grep { $_->{is_synthetic} } Finance::Underlying::all_underlyings();

    is $expected_synthetics{$_}, 1, "$_ symbol exits" for (keys %expected_synthetics);
};

done_testing;
