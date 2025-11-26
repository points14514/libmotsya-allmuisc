# Cross-distribution Makefile for libmotsys-allmuisz
# Configurable prefix (default: /usr)
PREFIX ?= /usr

# Compiler settings
CC = gcc
COBC = cobc
COBFLAGS = -x -fPIC -shared  # Generate position-independent shared library
CFLAGS = -fPIC -Wall -Wextra  # Enable warnings for better code quality
LDFLAGS = -shared -lc  # Link against libc (required for POSIX compatibility)

# Directory and file definitions
SRC_DIR = src
OBJ_FILE = $(SRC_DIR)/motsys-multimedia.o
TARGET_LIB = libcobolmotsys.so
HEADER_FILE = $(SRC_DIR)/muisc.h
INCLUDE_DIR = $(PREFIX)/include/cobolall

# Default target: Build the shared library
all: $(TARGET_LIB)

# Compile COBOL source to object file
$(OBJ_FILE): $(SRC_DIR)/motsys-multimedia.cbl
	$(COBC) $(COBFLAGS) -c $< -o $@

# Link object file to shared library
$(TARGET_LIB): $(OBJ_FILE)
	$(CC) $(CFLAGS) $(OBJ_FILE) -o $(TARGET_LIB) $(LDFLAGS)

# Clean build artifacts
clean:
	rm -f $(OBJ_FILE) $(TARGET_LIB)
	@echo "Cleaned build files"

# Install library and header file to system directories
install:
	# Create include directory if it doesn't exist
	mkdir -p $(INCLUDE_DIR)
	# Install shared library (mode 755: readable/executable by all)
	install -m 755 $(TARGET_LIB) $(PREFIX)/lib/
	# Install header file (mode 644: readable by all, writable by owner)
	install -m 644 $(HEADER_FILE) $(INCLUDE_DIR)/
	@echo "Installation completed successfully"

# Uninstall library and header file
uninstall:
	rm -f $(PREFIX)/lib/$(TARGET_LIB)
	rm -f $(INCLUDE_DIR)/muisc.h
	rmdir --ignore-fail-on-non-empty $(INCLUDE_DIR)
	@echo "Uninstallation completed successfully"

.PHONY: all clean install uninstall
