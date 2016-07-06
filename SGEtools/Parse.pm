package SGEtools::Parse;

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

sub SGEqstatf {
   my $ref;
   my $fh;
   my $parser;

   open ($fh, "qstat -f -xml|");
   $parser = XML::LibXML->new();
   $ref = $parser->load_xml(IO => $fh);

   return $ref;
}

sub SGEqstatustar {
   my $ref;
   my $fh;
   my $parser;

   open ($fh, "qstat -u \\\* -xml|");
   $parser = XML::LibXML->new();
   $ref = $parser->load_xml(IO => $fh);

   return $ref;
}
