#!perl 

use Test::More tests => 1;

BEGIN {
    use_ok( 'Piwik::API' ) || print "Bail out!
";
}

diag( "Testing Piwik::API $Piwik::API::VERSION, Perl $], $^X" );
