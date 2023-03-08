UNAME_S = $(shell uname -s)

BIN = bin
LIB = lbx
TARGET=$(BIN)/$(LIB).a
SRCS = $(shell find src -name "*.c")
OBJS = $(patsubst src/%, $(BIN)/%, $(patsubst %.c, %.o, $(SRCS)))
DEPS = $(patsubst %.o, %.d, $(OBJS))

CC = clang

CCFLAGS += -std=c17
CCFLAGS += -O2 -g -Wall -Wextra -Wpedantic
CCFLAGS += -Wno-unused-parameter
CCFLAGS += -Isrc
CCFLAGS += -Iinclude

LT = libtool

.PHONY: all clean

all: pre_build $(TARGET)

pre_build:
	@echo "@@ Building LBX @@"

$(TARGET): $(OBJS)
	$(LT) -static -o $@ $(OBJS)

$(BIN)/%.o: src/%.c Makefile
	mkdir -p $(@D)
	$(CC) -MMD -MP -c $(CCFLAGS) $< -o $@

clean:
	rm -rf $(BIN)

