# Compiler stuffs
CC = gcc
CFLAGS = -Wall -Wextra -Wpedantic -g
LDFLAGS = 

# Target paths
PREFIX = /usr
INSTALL_BIN_DIR = bin
INSTALL_INCLUDE_DIR = include

# Local paths
SRC_DIR = src
BUILD_DIR = build
TARGET_DIR = target

SH_SOURCES = $(wildcard $(SRC_DIR)/shell/*.c)
SH_OBJECTS = $(SH_SOURCES:$(SRC_DIR)/shell/%.c=$(BUILD_DIR)/shell/%.o)

FS_SOURCES = $(wildcard $(SRC_DIR)/fscore/*.c)
FS_OBJECTS = $(FS_SOURCES:$(SRC_DIR)/fscore/%.c=$(BUILD_DIR)/fscore/%.o)

# Local targets
EXECUTABLE_SOUPFS = $(BUILD_DIR)/shell/soupfs
KERNEL_MODULE = $(BUILD_DIR)/kernel/soupfs_module


# Currently we /only/ build the shell. This is because kernel is not yet implemented.
# Add the module target here when we're at that point.
all: shell


# Shell interface
shell: $(EXECUTABLE_SOUPFS)


# Kernel driver
module: $(KERNEL_MODULE)
	@echo "Nothing yet"


# Linking
$(EXECUTABLE_SOUPFS): $(SH_OBJECTS) $(FS_OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^

$(KERNEL_MODULE): $(FS_OBJECTS)
	@echo "Not yet implemented. Use shell instead"


# Compiling
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c -o $@ $<

# Install to PREFIX
install: targets
	cp -r -t $(TARGET_DIR) $(PREFIX)

# Installing to local targets/
targets: all
	mkdir -p $(TARGET_DIR)
	mkdir -p $(TARGET_DIR)/$(INSTALL_BIN_DIR)
	mkdir -p $(TARGET_DIR)/$(INSTALL_INCLUDE_DIR)
	install -m755 $(EXECUTABLE_SOUPFS) $(TARGET_DIR)/$(INSTALL_BIN_DIR)
	cp -rT $(INSTALL_INCLUDE_DIR) $(TARGET_DIR)/$(INSTALL_INCLUDE_DIR)/soupfs

# Burn
clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(TARGET_DIR)


# Don't treat as files
.PHONY: all soupfs module install targets clean
.DEFAULT: shell

