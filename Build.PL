use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Piwik::API',
    license             => 'perl',
    dist_author         => q{Jens Gassmann <jegade@cpan.org>},
    dist_version_from   => 'lib/Piwik/API.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Piwik-API-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
