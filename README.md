
This is a repository for various tools to help analyse (Son of) Grid Engine
clusters.

As of version 1.0, the primary tool is the SGEtools/Accounts.pm perl
module which contains helper functions for processing text-format job 
accounting files. The module's primary functions are documented via 
POD (perldoc SGEtools::Accounts)

This repo also contains two example scripts:

1) qacctj - an example of how to use SGEtools::Accounts to replicate the
functionality of "qacct -j jobid"

2) sgeacct - a simple script which shows per-user job usage between start 
and end points passed as arguments in any Date::Manip readable format, 
e.g.: "sgeacct 20160701 20160704"

Pre-requisites: sgeacct requires CPAN's Date::Manip module
