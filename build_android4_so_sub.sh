#!/bin/bash
NDK=F:/COD/NVPACK/android-ndk-r12b
SYSROOT=$NDK/platforms/android-23/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64

CPU=arm
ARCH=arm
PREFIX=$(pwd)/android/$CPU


#打包    libswresample/libswresample.a \
#./libavdevice/libavdevice.a \
#./libpostproc/libpostproc.a \
$TOOLCHAIN/bin/arm-linux-androideabi-ld \
    -rpath-link=$SYSROOT/usr/lib \
    -L$SYSROOT/usr/lib \
    -L$PREFIX/lib \
    -soname libffmpeg.so -shared -nostdlib -Bsymbolic --whole-archive --no-undefined -o \
    $PREFIX/libffmpeg.so \
    $PREFIX/lib/libavcodec.a \
    $PREFIX/lib/libavfilter.a \
    $PREFIX/lib/libavformat.a \
    $PREFIX/lib/libavutil.a \
    $PREFIX/lib/libswscale.a \
    $PREFIX/lib/libswresample.a \
    $PREFIX/lib/libavdevice.a \
    $PREFIX/lib/libpostproc.a \
    $PREFIX/lib/libx264.a \
    $PREFIX/lib/cmdutils.a\
    $PREFIX/lib/ffmpeg.a\
    $PREFIX/lib/ffmpeg_filter.a\
    $PREFIX/lib/ffmpeg_opt.a\
    $PREFIX/lib/ffserver_config.a\
    $PREFIX/lib/ffmpeg_hw.a\
    -lc -lm -lz -ldl -llog --dynamic-linker=/system/bin/linker \
    $TOOLCHAIN/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a

#strip
$TOOLCHAIN/bin/arm-linux-androideabi-strip  $PREFIX/libffmpeg.so 

# arm v7vfp
#CPU=armv7-a
#OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfp -marm -march=$CPU "
#PREFIX=./android/$CPU-vfp
#ADDITIONAL_CONFIGURE_FLAG=
#build_one
# CPU=armv
# PREFIX=$(pwd)/android/$CPU
# ADDI_CFLAGS="-marm"
# build_one
#arm v6
#CPU=armv6
#OPTIMIZE_CFLAGS="-marm -march=$CPU"
#PREFIX=./android/$CPU
#ADDITIONAL_CONFIGURE_FLAG=
#build_one
#arm v7vfpv3
# CPU=armv7-a
# OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfpv3-d16 -marm -march=$CPU "
# PREFIX=./android/$CPU
# ADDITIONAL_CONFIGURE_FLAG=
# build_one
#arm v7n
#CPU=armv7-a
#OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=neon -marm -march=$CPU -mtune=cortex-a8"
#PREFIX=./android/$CPU
#ADDITIONAL_CONFIGURE_FLAG=--enable-neon
#build_one
#arm v6+vfp
#CPU=armv6
#OPTIMIZE_CFLAGS="-DCMP_HAVE_VFP -mfloat-abi=softfp -mfpu=vfp -marm -march=$CPU"
#PREFIX=./android/${CPU}_vfp
#ADDITIONAL_CONFIGURE_FLAG=
#build_one