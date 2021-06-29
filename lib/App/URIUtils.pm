package App::URIUtils;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    summary => 'Utilities related to URI/URL',
};

$SPEC{parse_url} = {
    v => 1.1,
    summary => 'Parse URL string into a hash of information',
    args => {
        url => {schema => 'str*', req=>1, pos=>0},
        base => {schema => 'str*', pos=>1},
    },
    result_naked => 1,
    examples => [
        {args=>{url=>'https://www.tokopedia.com/search?st=product&q=soundmagic%20e10'}},
    ],
};
sub parse_url {
    require URI::URL;

    my %args = @_;
    my $url = URI::URL->new($args{url}, $args{base});
    +{
        orig => $args{url},
        base => $args{base},

        scheme => $url->scheme,
        has_recognized_scheme => $url->has_recognized_scheme,
        opaque => $url->opaque,
        path => $url->path, # unescaped string
        fragment => $url->fragment,
        canonical => $url->canonical . "",
        authority => $url->authority,
        query => $url->query, # escaped

        # server/host methods
        host => $url->host,
        port => $url->port,
        default_port => $url->default_port,

        #abs_path  => $url->abs_path,
        full_path => $url->full_path, # abs_path || "/"

    };
}

1;
#ABSTRACT:

=head1 DESCRIPTION

This distributions provides the following command-line utilities:

# INSERT_EXECS_LIST


=head1 SEE ALSO

=cut
