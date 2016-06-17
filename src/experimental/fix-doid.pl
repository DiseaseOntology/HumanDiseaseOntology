#!/usr/bin/perl
while(<>) {
    # https://github.com/obophenotype/human-disease-ontology/issues/29
    #next if m@A combined T cell and B cell immunodeficiency that is caused by a mutatino in the LIG4@;
    s@xref: MSH@xref: MESH@;
    print;
}
