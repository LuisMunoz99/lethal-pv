# Authors:     LM
# Maintainers: LM
# =========================================

# Args:
input := ../import/output/fatal-victims.csv
output := output/fatal-victims-final.csv
src := src/clean-fv.R

.PHONY: all clean

all: $(output)

# Rule to generate the output file
$(output): $(src) $(input)
	@mkdir -p $(dir $@) \
	&& Rscript $(src) \
	--input=$(input) \
	--output=$@

# Clean up generated files
clean:
	@rm -rf $(dir $(output))/*
