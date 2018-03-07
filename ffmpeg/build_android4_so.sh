#!/bin/bash
NDK=F:/COD/NVPACK/android-ndk-r12b
SYSROOT=$NDK/platforms/android-23/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64

CPU=arm
ARCH=arm
PREFIX=$(pwd)/android/$CPU

ADDI_CFLAGS="-marm"

EXTRA_CFLAGS="-IF:/video_wrkst/libx264/x264"
EXTRA_LDFLAGS="-LF:/video_wrkst/libx264/x264"


#配置
./configure \
    --prefix=$PREFIX \
    --arch=$ARCH \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --extra-ldflags="-L../x264 $ADDI_LDFLAGS" \
    --sysroot=$SYSROOT \
    --extra-cflags="-I../x264 -Os -fpic $ADDI_CFLAGS" \
    --target-os=linux \
    --enable-cross-compile \
    --enable-gpl \
    --disable-shared \
    --enable-static \
    --disable-doc \
    --disable-debug \
    --enable-small \
    --disable-programs \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-asm\
    --enable-libx264 \
    --enable-encoder=libx264 \
    $ADDITIONAL_CONFIGURE_FLAG

#编译
make clean

make -j4

make install

#打包    libswresample/libswresample.a \
$TOOLCHAIN/bin/arm-linux-androideabi-ld \
    -rpath-link=$SYSROOT/usr/lib \
    -L$SYSROOT/usr/lib \
    -L$PREFIX/lib \
    -soname libffmpeg.so -shared -nostdlib -Bsymbolic --whole-archive --no-undefined -o \
    $PREFIX/libffmpeg.so \
    libavcodec/libavcodec.a \
    libavfilter/libavfilter.a \
    libavformat/libavformat.a \
    libavutil/libavutil.a \
    libswscale/libswscale.a \
    libavdevice/libavdevice.a \
    libpostproc/libpostproc.a \
    -lc -lm -lz -ldl -llog --dynamic-linker=/system/bin/linker \
    $TOOLCHAIN/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a

#strip
$TOOLCHAIN/bin/arm-linux-androideabi-strip  $PREFIX/libffmpeg.so 