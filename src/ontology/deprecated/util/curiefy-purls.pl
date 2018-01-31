#!/usr/bin/perl -pn
if (m@http://purl.obolibrary.org/obo/([A-Za-z]+)_@) {
    s@http://purl.obolibrary.org/obo/([A-Za-z]+)_@$1:@g;
}
if (m@http://linkedlifedata.com/resource/umls/id/@) {
    s@http://linkedlifedata.com/resource/umls/id/@UMLS:@g;
}
s@<(\w+):(\w+)>@$1:$2@g;
s@"@@g;
