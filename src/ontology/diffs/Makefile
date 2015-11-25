
OBO=http://purl.obolibrary.org/obo
ONT = doid
SRC = ../$(ONT).obo
LAST = $(OBO)/$(ONT).obo

all: $(ONT)-obo-diff.html $(ONT)-def-diff.html $(ONT)-lastbuild.obo $(ONT)-combined-diff.txt

$(ONT)-obo-diff.html: $(ONT)-lastbuild.obo $(SRC)
	compare-obo-files.pl --config 'html/ontology_name=$(ONT)' --rss-path . -f1 $< -f2 $(SRC) -m html text rss -o $(ONT)-obo-diff && replace-amigo-urls-with-purls.pl $@
$(ONT)-def-diff.html: $(ONT)-lastbuild.obo $(SRC)
	compare-defs.pl --config 'html/ontology_name=$(ONT)' --rss-path . -f1 $< -f2 $(SRC) -m html text rss -o $(ONT)-def-diff && replace-amigo-urls-with-purls.pl $@

$(ONT)-combined-diff.txt: $(ONT)-def-diff.html $(ONT)-obo-diff.html
	cat $(ONT)-def-diff.txt $(ONT)-obo-diff.txt > $@

$(ONT)-lastbuild.obo: $(SRC)
	wget $(LAST) -O $@
