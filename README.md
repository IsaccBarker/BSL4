Development suspended while I write my LasV bootloader. Below is not informational, but just a reminder on how to build a x86_64 cross compiler on an M1.

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

