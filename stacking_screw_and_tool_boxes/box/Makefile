.SECONDARY:

SCADS  := $(wildcard *.scad)
STLS   := $(wildcard *.stl) $(SCADS:.scad=.stl)
GCODES := $(STLS:.stl=.gcode)
CONFIG := $(wildcard *.ini)

STLS_TO_ROTATE += 1SSSectionScrewBox.stl
STLS_TO_ROTATE += 2SSSectionScrewBox.stl
STLS_TO_ROTATE += 3SSSectionScrewBox.stl
STLS_TO_ROTATE += 5SSSectionScrewBox.stl

.PHONY: all
all: $(GCODES)

$(STLS) $(SCADS) $(GCODES): Makefile $(CONFIG)

%.stl: %.scad
	openscad -o "$@" "$<"

$(STLS_TO_ROTATE:.stl=.gcode): EXTRA_FLAGS := --rotate 90

%.gcode: %.stl
	slic3r --load "$(CONFIG)" $(EXTRA_FLAGS) "$<"


.PHONY: clean
clean:
	rm -fv $(GCODES) $(SCADS:.scad=.stl)
