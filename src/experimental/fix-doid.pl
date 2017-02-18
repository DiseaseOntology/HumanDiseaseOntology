#!/usr/bin/perl
while(<>) {
    s@xref: MSH@xref: MESH@;
    print;
}
