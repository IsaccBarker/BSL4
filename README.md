# BSL4
An exokernel for a bygone era. Built for x86\_64, it should be able to compile out of the box on most
modern machines (unless you are running x86 or some ARM processor, like on an M1).

It's written in a mix of C and Rust. C comes into play where Rust would mostly be unsafe code, such as
in the very early stages of booting. Other than that, Rust is used.

## Building
So far, there is no Rust code, only C. If you are on a non x86\_64 platform, please build a cross compiler,
and set the `CC`, `LD`, and `AS` environment variable it's location, or the name of the executable if it is
in your path.

```
make
```

### Building a x86_64 cross compiler on a Mac
I do most of my development on my school laptop, running an M1, which means I had to get a cross compiler working. *It is a pain in the ass
and it's really convoluted.* I've added instructions here for future reference.

First, you have to build binutils
```
xz -d binutils.tar.xz
tar -xf binutils.tar
mkdir -p build/cross
cd build
../binutils/configure --target=x86_64-elf --prefix="$PWD/cross"
make
sudo make install
export PATH="$PATH:$PWD/cross"
```

Then GMP
```
xz -d gmp.tar.xz
tar -xf gmp.tar
mkdir -p build
cd build
../gmp/configure
make
sudo make install
```

Then MPFR
```
xz -d mpfr.tar.xz
tar -xf mpft.tar
mkdir -p build
cd build
../mpfr/configure
make
sudo make install
```

Then MPC
```
xz -d mpc.tar.xz
tar -xf mpc.tar
mkdir -p build
cd build
../mpc/configure
make
sudo make install
```

And then GCC
```
xz -d gcc.tar.xz
tar -xf gcc.tar
mkdir -p build/cross
cd build
export LD_LIBRARY_PATH=/usr/local/lib
../gcc/configure --target=x86_64-elf --prefix=$PWD/cross \
    --disable-nls --enable-languages=c,c++ --without-headers --enable-interwork \
    --enable-multilib --with-mpc=/usr/local/lib --with-mpfr=/usr/local/lib \
    --with-gmp=/usr/local/lib
make all-gcc
make all-target-libgcc
sudo make install-gcc
sudo make install-target-libgcc
export PATH="$PATH:$PWD/cross"
```

