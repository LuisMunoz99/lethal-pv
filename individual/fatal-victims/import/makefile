# Authors:     LM
# Maintainers: LM
# =========================================

# Args:
output := output/fatal-victims.csv
src := src/import-fv.R

.PHONY: all clean

all: $(output)

# Rule to generate the output file
$(output): $(src) 
	@mkdir -p $(dir $@) \
	&& Rscript $(src) \
	--output=$@

# Clean up generated files
clean:
	@rm -rf $(dir $(output))/*
