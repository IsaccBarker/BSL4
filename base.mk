# TARGET
# The target to assemble for

# ARCH
# The archecture of the target platform. Should
# coraspond to directories inside `arch`.

# TOOLCHAIN_PREFIX
# The prefix on where to look for the keychain.
# May be left empty if the toolchain is in your
# path.

# GAS assembler.
ASFLAGS=
AS=as

# AR_FLAGS
# Flags that are passed to the archive utility

# LD_FLAGS
# Flags that are passed to the linker (links all the object files
# into a single .bin file).

# STRIP_FLAGS
# Flags that are passed to the (binary) stripper.

# CARGO_FLAGS
# Flags that are passed to cargo during the build of the kernel.

# What kind of build do we do (debug/release)?
BUILD_MODE=debug

# Platform shit.
ARCH ?= aarch64

# DO NOT SET THESE
# These are basically internal global variables

PROGRESS := @printf "  \\033[1;32m%8s\\033[0m  \\033[1;m%s\\033[0m\\n"
SLK_LOCATION=
BACKEND=

