use Test::More;
use Test::Deep;

use lib '../lib';
use 5.010;

use_ok 'Box::Calc';

my $calc = Box::Calc->new(api_key => $ENV{BOX_CALC_API_KEY});

isa_ok $calc, 'Box::Calc';

$calc->add_box_type(
            name        => 'A',
            weight      => 20,
            x           => 5,
            y           => 10,
            z           => 8,
        );
$calc->add_box_type(
            name        => 'B',
            weight      => 7,
            x           => 4,
            y           => 6,
            z           => 2,
        );
$calc->add_item(
            quantity    => 5,
            name        => 'Banana',
            weight      => 5,
            x           => 3,
            y           => 1,
            z           => 4.5,
        );

my $packing_list = $calc->packing_list;

done_testing;

