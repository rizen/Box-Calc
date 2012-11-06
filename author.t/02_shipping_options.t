use strict;
use Test::More;
use lib '../lib';
use_ok 'Box::Calc';

note "API Key: $ENV{BOX_CALC_API_KEY}";
my $calc = Box::Calc->new(api_key => $ENV{BOX_CALC_API_KEY});

isa_ok $calc, 'Box::Calc';
$calc->add_box_type(
            name        => 'A',
            weight      => 20,
            x           => 5,
            y           => 10,
            z           => 8,
            compatible_services => ['USPS First-Class', 'USPS Parcel Post', 'USPS Priority Medium Flat Rate Box'],
        );
$calc->add_box_type(
            name        => 'B',
            weight      => 7,
            x           => 4,
            y           => 6,
            z           => 2,
            compatible_services => ['USPS Priority Medium Flat Rate Box', 'USPS Priority'],
        );
$calc->add_item(
            quantity    => 5,
            name        => 'Banana',
            weight      => 5,
            x           => 3,
            y           => 1,
            z           => 4.5,
        );

my $options = $calc->shipping_options(from => 53716, to => 90210)->recv;

is ref $options, 'HASH', 'got a list back';
is $options->{'USPS Parcel Post'}{parcels}[0]{name}, 'A', 'box A as it should be';
ok ! exists $options->{'USPS First-Class'} , 'too big for first class';


done_testing();

