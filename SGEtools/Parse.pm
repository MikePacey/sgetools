package SGEtools::Parse;

=head1 SYNOPSIS

 use SGEtools::Parse;

 my ($queuelist, $joblist);
 my $x;

 $queuelist = SGEqstatf ();
 $joblist   = SGEqstatustar ();

 foreach $x ($ref->findnodes('/job_info/queue_info/Queue-List')) {
    # Process job item
 }

=head1 DESCRIPTION

SGEtools::Parse contains a set of helper functions which use XML::LibXML
to return parsed XML output from (Son of) Grid Engine commands such as qstat.

The returned parse can be interrogated using XML::LibXML functions such
as findnodes() or findvalue()

=head1 USAGE

=cut

use strict;
use warnings;

use XML::LibXML;

our $VERSION;
$VERSION = '1.0';

our (@ISA, @EXPORT);

BEGIN {
  require Exporter;
  @ISA = qw(Exporter);
  @EXPORT = qw(SGEqstatf SGEqstatustar);
}

=pod

=over

=item C<SGEqstatf()>

Returns parsed output from a call to "qstat -f -xml"

=back

=cut

sub SGEqstatf {
   my $ref;
   my $fh;
   my $parser;

   open ($fh, "qstat -f -xml|");
   $parser = XML::LibXML->new();
   $ref = $parser->load_xml(IO => $fh);

   return $ref;
}

=pod

=over

=item C<SGEqstatustar()>

Returns parsed output from a call to "qstat -u \* -xml"

=back

=cut

sub SGEqstatustar {
   my $ref;
   my $fh;
   my $parser;

   open ($fh, "qstat -u \\\* -xml|");
   $parser = XML::LibXML->new();
   $ref = $parser->load_xml(IO => $fh);

   return $ref;
}
