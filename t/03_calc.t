use Test::More;

use lib '../lib';
use 5.010;

use_ok 'Box::Calc';

my $calc = Box::Calc->new(api_key => 'just testing');

isa_ok $calc, 'Box::Calc';

my $container = $calc->add_box_type(x => 3, y => 7, z => 2, weight => 20, name => 'big, big box', categories => ['USPS Priority']);
isa_ok $container, 'Box::Calc::BoxType';

my $item = $calc->add_item(x => 3, y => 7, z => 2, name => 'test', weight => 14);

isa_ok $item, 'Box::Calc::Item';

eval { $calc->shipping_options(from => 531) };

isa_ok $@, 'Ouch';
is $@->code, 'bad param', 'from zip fails as it should';
is $@->data, 'from', 'it is the from field failing';

eval { $calc->shipping_options(from => 53716 ) };

isa_ok $@, 'Ouch';
is $@->code, 'bad param', 'to fails as it should';
is $@->data, 'to', 'it is the to field failing';

done_testing;

