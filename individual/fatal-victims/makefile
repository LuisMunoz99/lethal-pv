# Authors:     LM
# Maintainers: LM
# =========================================
#
# Args:
output := output/fatal-victims-final.csv

.PHONY: all import clean export

all: import clean export

export:
	mkdir -p export/output
	ln -sf ../$(output) export/output/

clean:
	cd clean && make

import:
	cd import && make

