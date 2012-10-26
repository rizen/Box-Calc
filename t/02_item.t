use Test::More;

use lib '../lib';
use 5.010;

use_ok 'Box::Calc::Item';

my $item = Box::Calc::Item->new(x => 3, y => 7, z => 2, name => 'test', weight => 14);

isa_ok $item, 'Box::Calc::Item';

is $item->x, 3, 'took x';
is $item->y, 7, 'took y';
is $item->z, 2, 'took z';
is $item->name, 'test', 'took name';
is $item->weight, 14, 'took weight';
is $item->quantity, 1, 'defaulted quantity';


done_testing;

