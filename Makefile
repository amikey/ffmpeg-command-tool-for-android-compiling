#ndk根目录
NDK_ROOT=F:/COD/NVPACK/android-ndk-r12b

#编译器根目录
TOOLCHAINS_ROOT=$(NDK_ROOT)/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64

#编译器目录
TOOLCHAINS_PREFIX=$(TOOLCHAINS_ROOT)/bin/arm-linux-androideabi

#头文件搜索路径
TOOLCHAINS_INCLUDE=$(TOOLCHAINS_ROOT)/lib/gcc/arm-linux-androideabi/4.9.x/include-fixed

#SDK根目录
PLATFROM_ROOT=$(NDK_ROOT)/platforms/android-23/arch-arm

#sdk头文件搜索路径
PLATFROM_INCLUDE=$(PLATFROM_ROOT)/usr/include

#sdk库文件搜索路径
PLATFROM_LIB=$(PLATFROM_ROOT)/usr/lib

#文件名称
MODALE_NAME=ffmpeg_opt

#删除
RM=del

#编译选项
FLAGS=-I$(TOOLCHAINS_INCLUDE)\
	-IF:\video_wrkst\ffmpeg-commands-executor-library-master\source\ffmpeg_neo\
	-I$(PLATFROM_INCLUDE)\
	-L$(PLATFROM_LIB)\
	-nostdlib\
	-lgcc\
	-Bdynamic\
	-lc

#编译选项2
FLAGSMY=-I$(TOOLCHAINS_INCLUDE)\
	-I$(PLATFROM_INCLUDE)\
	-L$(PLATFROM_LIB)\
	-nostdlib\
	-lgcc\
	-Bdynamic\
	-lc\
	-fPIC\
	-shared 

#所有obj文件
OBJS=$(MODALE_NAME).o\
	$(PLATFROM_LIB)/crtbegin_dynamic.o\
	$(PLATFROM_LIB)/crtend_android.o 

#编译器链接
all:cmdutils ffmpeg ffmpeg_filter ffmpeg_opt ffprobe ffserver ffserver_config
.PHONY : all
#编译.o
	#$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c $(MODALE_NAME).c -o $(MODALE_NAME).o
	#$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(OBJS) -o $(MODALE_NAME)
#编译.a
	#$(TOOLCHAINS_PREFIX)-ar rc $(MODALE_NAME).a $(MODALE_NAME).o
#编译.so
	#$(TOOLCHAINS_PREFIX)-gcc $(FLAGSMY) $(MODALE_NAME).c -o $(MODALE_NAME).so

cmdutils:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c cmdutils.c -o cmdutils.o
	$(TOOLCHAINS_PREFIX)-ar rc cmdutils.a cmdutils.o

cmdutils_opencl:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c cmdutils_opencl.c -o cmdutils_opencl.o
	$(TOOLCHAINS_PREFIX)-ar rc cmdutils_opencl.a cmdutils_opencl.o

ffmpeg:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffmpeg.c -o ffmpeg.o
	$(TOOLCHAINS_PREFIX)-ar rc ffmpeg.a ffmpeg.o

ffmpeg_dxva2:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffmpeg_dxva2.c -o ffmpeg_dxva2.o
	$(TOOLCHAINS_PREFIX)-ar rc ffmpeg_dxva2.a ffmpeg_dxva2.o

ffmpeg_filter:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffmpeg_filter.c -o ffmpeg_filter.o
	$(TOOLCHAINS_PREFIX)-ar rc ffmpeg_filter.a ffmpeg_filter.o

ffmpeg_opt:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffmpeg_opt.c -o ffmpeg_opt.o
	$(TOOLCHAINS_PREFIX)-ar rc ffmpeg_opt.a ffmpeg_opt.o

ffmpeg_vda:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffmpeg_vda.c -o ffmpeg_vda.o
	$(TOOLCHAINS_PREFIX)-ar rc ffmpeg_vda.a ffmpeg_vda.o

ffmpeg_vdpau:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffmpeg_vdpau.c -o ffmpeg_vdpau.o
	$(TOOLCHAINS_PREFIX)-ar rc ffmpeg_vdpau.a ffmpeg_vdpau.o

ffplay:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffplay.c -o ffplay.o
	$(TOOLCHAINS_PREFIX)-ar rc ffplay.a ffplay.o

ffprobe:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffprobe.c -o ffprobe.o
	$(TOOLCHAINS_PREFIX)-ar rc ffprobe.a ffprobe.o

ffserver:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffserver.c -o ffserver.o
	$(TOOLCHAINS_PREFIX)-ar rc ffserver.a ffserver.o

ffserver_config:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffserver_config.c -o ffserver_config.o
	$(TOOLCHAINS_PREFIX)-ar rc ffserver_config.a ffserver_config.o

ffmpeg_hw:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) -c ffmpeg_hw.c -o ffmpeg_hw.o
	$(TOOLCHAINS_PREFIX)-ar rc ffmpeg_hw.a ffmpeg_hw.o
#删除所有.o文件
clean:
	$(RM) *.o
