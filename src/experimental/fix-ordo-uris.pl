#!/usr/bin/perl
while(<>) {
    s@http://purl.obolibrary.org/obo/Orphanet_@http://www.orpha.net/ORDO/Orphanet_@g;
    print;
    
}
