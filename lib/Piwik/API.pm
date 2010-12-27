package Piwik::API;


use Mojo::Client;
use JSON;
use Moose;


has 'token_auth' => (
    is  => 'rw',
    isa => 'Str',
);

has 'backend' => (
    is  => 'rw',
    isa => 'Str',
);

has 'error_status' => (
    is  => 'rw',
    isa => 'Str',
);

has 'error_code' => (
    is  => 'rw',
    isa => 'Str'
);

has 'client' => (

    is      => 'rw',
    default => sub { Mojo::Client->new },

);

has 'format' => (

    is      => 'rw',
    isa     => 'Str',
    default => 'json',
);

no Moose;

=head1 NAME

Piwik::API - Use the piwik API

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Add/Delete and list users and sites from user piwik

Perhaps a little code snippet.

    use Piwik::API;

    my $foo = Piwik::API->new();
    ...

=head1 SUBROUTINES/METHODS

=cut

sub _request {

    my ( $self, $method, $params ) = @_;

    my $tx = $self->client->post_form(
        $self->backend => {
            module     => 'API',
            method     => $method,
            format     => $self->format,
            token_auth => $self->token_auth,
            %{ $params || {} }

        }
    );

    if ( my $res = $tx->success ) {

        if ( $self->format eq 'json' ) {

            $self->error_status("");
            $self->error_code("");
            return from_json( $res->body, { utf8 => 1 } );

        } else {

            die "Wrong format, currently only json is supported";

        }
    } else {

        my ( $error, $code ) = $tx->error;

        $self->error_status($error);
        $self->error_code($code);

        return;
    }
}

=head2 add_site

    addSite

=cut

sub add_site {

    my ( $self, $name, $urls ) = @_;
    $self->_request( 'SitesManager.addSite', { siteName => $name, urls => $urls } );
}

=head2 delete_site

    deleteSite

=cut

sub delete_site {

    my ( $self, $site_id ) = @_;
    $self->_request( 'SitesManager.deleteSite', { idSite => $site_id } );
}

=head2 list_sites
    
    getAllSitesId
    
=cut

sub list_sites {

    my ($self) = @_;
    $self->_request('SitesManager.getAllSitesId');
}

=head2 get_site_code

    SitesManager.getJavascriptTag

=cut

sub get_site_code {

    my ( $self, $site_id ) = @_;

    my $return = $self->_request( 'SitesManager.getJavascriptTag', { idSite => $site_id } );

    if ($return) {

        return $return->{value};

    } else {

        die $self->error_code . " " . $self->error_status;
    }
}

=head2 get_site

    SitesManager.getSiteFromId 

=cut

sub get_site {

    my ( $self, $site_id ) = @_;
    my $ret = $self->_request( 'SitesManager.getSiteFromId', { idSite => $site_id } );

    if ( ref $ret eq 'ARRAY' ) {

        $ret->[0];

    } else {

        return;
    }
}

=head2 add_user

    addUser

=cut

sub add_user {

    my ( $self, $username, $password, $email ) = @_;
    $self->_request( 'UsersManager.addUser', { userLogin => $username, password => $password, email => $email } );
}

=head2 delete_user

    deleteUser

=cut

sub delete_user {

    my ( $self, $username ) = @_;
    $self->_request( 'UsersManager.deleteUser', { userLogin => $username } );
}

=head2 get_user

    UsersManager.getUser

=cut

sub get_user {

    my ( $self, $username ) = @_;
    my $ret = $self->_request( 'UsersManager.getUser', { userLogin => $username } );

    if ( ref $ret eq 'ARRAY' ) {

        $ret->[0];

    } else {

        return;
    }
}

=head2 assign_user

    setUserAccess 

=cut

sub assign_user {

    my ( $self, $username, $site_id ) = @_;
    $self->_request( 'UsersManager.setUserAccess', { userLogin => $username, idSite => $site_id } );

}





=head1 AUTHOR

Jens Gassmann, C<< <jegade at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-piwik-api at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Piwik-API>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Piwik::API

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Piwik-API>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Piwik-API>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Piwik-API>

=item * Search CPAN

L<http://search.cpan.org/dist/Piwik-API/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Jens Gassmann.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Piwik::API
