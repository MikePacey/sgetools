# SGEtools

This is a repository for various tools to help analyse (Son of) Grid Engine
clusters.

The repo contains perl packages along with some sample per scripts and tools.
Scripts using this module are:

## SGEtools::Parse

The packages uses **XML::LibXML** to create parses of the -xml output from tools
such as qstat. Scripts using this package are:

**qerr** - a small sample script which outputs all queue instances in error states
(e.g. alarm or unavailable - but not disabled)

**qusage, qwaiting** - summarises per-user running and waiting jobs using output
from qstat -u \*

## SGEtools::Accounts

This packages contains helper functions to read text based job accounting
files, including the ability to easily process (optionally compressed)
log-rotated accounting files. Scripts using this module are:

**qacctj** - an example script showing how to use SGEtools::Accounts to replicate 
the functionality of "qacct -j jobid"

**sgeacct** - a simple script which shows a per-user job usage summary between start 
and end points passed as arguments in any Date::Manip readable format, 
e.g.: "sgeacct 20160701 20160704"

Pre-requisites: sgeacct requires CPAN's Date::Manip module
