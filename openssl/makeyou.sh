NDK=F:/COD/NVPACK/android-ndk-r12b
SYSROOT=$NDK/platforms/android-23/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64

CPU=arm
ARCH=arm
PREFIX=$(pwd)/android/$CPU
 
 
 
 
 
./Configure \
    --sysroot=$SYSROOT \
    --cross-compile-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --prefix=$PWD/dist no-idea no-mdc2 no-rc5 static android \
 
 
#make
# 
#make install
# 
#make distclean