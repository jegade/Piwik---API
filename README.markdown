# NAME

Piwik::API - Use the piwik API

# VERSION

Version 0.02

# SYNOPSIS

Add/Delete and list users and sites from user piwik

Perhaps a little code snippet.

    use Piwik::API;

    my $foo = Piwik::API->new();
    ...

# SUBROUTINES/METHODS

## add_site

    addSite

## delete_site

    deleteSite

## list_sites
    

    getAllSitesId
    

## get_site_code

    SitesManager.getJavascriptTag

## get_site

    SitesManager.getSiteFromId 

## add_user

    addUser

## delete_user

    deleteUser

## get_user

    UsersManager.getUser

## assign_user

    setUserAccess 

# AUTHOR

Jens Gassmann, `<jegade at cpan.org>`

# BUGS

Please report any bugs or feature requests to `bug-piwik-api at rt.cpan.org`, or through
the web interface at [http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Piwik-API](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Piwik-API).  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.



# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Piwik::API

You can also look for information at:

- RT: CPAN's request tracker

[http://rt.cpan.org/NoAuth/Bugs.html?Dist=Piwik-API](http://rt.cpan.org/NoAuth/Bugs.html?Dist=Piwik-API)

- AnnoCPAN: Annotated CPAN documentation

[http://annocpan.org/dist/Piwik-API](http://annocpan.org/dist/Piwik-API)

- CPAN Ratings

[http://cpanratings.perl.org/d/Piwik-API](http://cpanratings.perl.org/d/Piwik-API)

- Search CPAN

[http://search.cpan.org/dist/Piwik-API/](http://search.cpan.org/dist/Piwik-API/)



# ACKNOWLEDGEMENTS



# LICENSE AND COPYRIGHT

Copyright 2010 Jens Gassmann.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

