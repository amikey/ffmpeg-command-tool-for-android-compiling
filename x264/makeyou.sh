NDK=F:/COD/NVPACK/android-ndk-r12b
SYSROOT=$NDK/platforms/android-23/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64

CPU=arm
ARCH=arm
PREFIX=$(pwd)/android/$CPU
 
 
 
 
 
./configure \
    --prefix=$PREFIX \
    --sysroot=$SYSROOT \
    --host=arm-linux \
    --enable-static \
    --enable-shared \
    --enable-pic \
    --disable-cli \
    --arch=$ARCH \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
 
 
#make
# 
#make install
# 
#make distclean