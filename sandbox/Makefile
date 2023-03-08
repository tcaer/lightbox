UNAME_S = $(shell uname -s)

BIN = bin
EXE = sandbox
TARGET = $(BIN)/$(EXE)
SRCS = $(shell find src -name "*.c")
OBJS = $(patsubst src/%, $(BIN)/%, $(patsubst %.c, %.o, $(SRCS)))
DEPS = $(patsubst %.o, %.d, $(OBJS))

CC = clang

CCFLAGS += -std=c17
CCFLAGS += -O2 -g -Wall -Wextra -Wpedantic
CCFLAGS += -Wno-unused-parameter
CCFLAGS += -Isrc
CCFLAGS += -I../lbx/include

LDFLAGS += ../lbx/bin/lbx.a

.PHONY: all lib clean

all: pre_build lib $(TARGET)

pre_build:
	@echo "@@ Building Sandbox @@"

$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(TARGET)

$(BIN)/%.o: src/%.c Makefile
	mkdir -p $(@D)
	$(CC) -MMD -MP -c $(CCFLAGS) $< -o $@

lib:
	@echo "- Building Libraries"
	cd ../lbx && make

clean:
	rm -rf $(BIN)

