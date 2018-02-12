#!/bin/bash
export TMPDIR="F:/video_wrkst/ffmpeg-commands-executor-library-master/source/ffmpeg/tmp"

# NDK的路径，根据实际安装位置设置
NDK=F:/COD/NVPACK/android-ndk-r12b
#F:/COD/NVPACK/android-ndk-r12b/platforms/android-23/  
# 编译针对的平台，这里选择最低支持android-14, arm架构，生成的so库是放在libs/armeabi文件夹下的，若针对x86架构，要选择arch-x86
PLATFORM=$NDK/platforms/android-23/arch-arm

# 工具链的路径，arm-linux-androideabi-4.9与上面设置的PLATFORM对应，4.9为工具的版本号
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64


# arm v7vfp
CPU=armv7-a
PREFIX=$(pwd)/android/$CPU

ADDI_CFLAGS="-marm"
EXTRA_CFLAGS="-IF:/video_wrkst/libx264/x264"
EXTRA_LDFLAGS="-LF:/video_wrkst/libx264/x264"

./configure \
    --prefix=$PREFIX \
    --enable-static \
	--disable-shared \
	--enable-pic \
	--enable-pthreads \
    --disable-doc \
    --enable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-avdevice \
    --disable-doc \
    --disable-symver \
	--disable-ffserver \
	--disable-debug \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--extra-ldflags="-L../x264 -Wl,-z,relro -Wl,-z,now -pie" \
    --extra-cflags="-I$PLATFORM/usr/include -I../x264 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fno-strict-overflow -fstack-protector-all" \
    --target-os=linux \
    --arch=arm \
	--enable-gpl \
	--enable-libx264 \
	--enable-encoder=libx264 \
    --enable-cross-compile \
    --sysroot=$PLATFORM \


make clean
make -j4
make install

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
