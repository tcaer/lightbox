UNAME_S = $(shell uname -s)

# Output destinations
BIN = bin
LIB = lbx
SANDBOX = sbx
TARGET_LBX = $(BIN)/$(LIB).a
TARGET_SBX = $(BIN)/$(SANDBOX)

# Compiler configs
CC = clang

CCFLAGS += -std=c17
CCFLAGS += -O2 -g -Wall -Wextra -Wpedantic -Wstrict-prototypes
CCFLAGS += -Wno-unused-parameter

# Lightbox config
SRCS_LBX = $(shell find lbx/src -name "*.c")
OBJS_LBX = $(patsubst lbx/src/%, $(BIN)/lbx/%, $(patsubst %.c, %.o, $(SRCS_LBX)))
DEPS_LBX = $(patsubst %.o, %.d, $(OBJS_LBX))

CCFLAGS_LBX = $(CCFLAGS) 
CCFLAGS_LBX += -Ilbx/src -Ilbx/include

LT = libtool

# Sandbox config
SRCS_SBX = $(shell find sandbox/src -name "*.c")
OBJS_SBX = $(patsubst sandbox/src/%, $(BIN)/sandbox/%, $(patsubst %.c, %.o, $(SRCS_SBX)))
DEPS_SBX = $(patsubst %.o, %.d, $(OBJS_SBX))

CCFLAGS_SBX = $(CCFLAGS)
CCFLAGS_SBX += -Ilbx/include

LDFLAGS_SBX = bin/lbx.a

# General commands
.PHONY: all lbx sandbox clean

all: lbx sandbox

run: all
	@bin/sbx

clean:
	rm -rf bin

# Lightbox commands
lbx: pre_lbx $(TARGET_LBX)
pre_lbx:
	@echo "@@ Building Lightbox @@"

$(TARGET_LBX): $(OBJS_LBX)
	$(LT) -static -o $@ $(OBJS_LBX)

$(BIN)/lbx/%.o: lbx/src/%.c Makefile
	mkdir -p $(@D)
	$(CC) -MMD -MP -c $(CCFLAGS_LBX) $< -o $@

# Sandbox commands
sandbox: pre_sbx $(TARGET_SBX)
pre_sbx:
	@echo "@@ Building Sandbox @@"

$(TARGET_SBX): $(OBJS_SBX)
	$(CC) $(OBJS_SBX) $(LDFLAGS_SBX) -o $(TARGET_SBX)

$(BIN)/sandbox/%.o: sandbox/src/%.c Makefile
	mkdir -p $(@D)
	$(CC) -MMD -MP -c $(CCFLAGS_SBX) $< -o $@

