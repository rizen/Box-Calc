use Test::More;
use Test::Deep;

use lib '../lib';
use 5.010;

use_ok 'Box::Calc::BoxType';

my $container = Box::Calc::BoxType->new(x => 3, y => 7, z => 2, weight => 20, name => 'big, big box', compatible_services => ['USPS Priority']);

isa_ok $container, 'Box::Calc::BoxType';

is $container->x, 3, 'took x';
is $container->y, 7, 'took y';
is $container->z, 2, 'took z';
is $container->name, 'big, big box', 'took name';
cmp_deeply $container->compatible_services, ['USPS Priority'], 'took categories';

done_testing;

