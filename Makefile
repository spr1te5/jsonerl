ERL  := erl
ERLC := erlc

ERLC_FLAGS := -Wall +native

SRC   := $(wildcard src/*.erl)
BEAMS := $(SRC:src/%.erl=ebin/%.beam) 

compile: $(BEAMS)

clean:
	rm -f ebin/*.{beam}

.SUFFIXES: .erl .beam
.PHONY:    clean

ebin/%.beam : src/%.erl
	$(ERLC) $(ERLC_FLAGS) -o $(dir $@) $<
