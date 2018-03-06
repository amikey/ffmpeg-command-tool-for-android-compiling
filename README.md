Compile log
=============  
rename make make_neo  
rename make_bk make  
[in mysys]make  
generating batches of .o/.a files for various modules……  
waiting……  
waiting……  
waiting……  
Wrong...I remember suddently  
[in mysys]ctrl+c  
[in mysys]./build_android4_so.sh  
generating batches of .o files for various modules……  
waiting……  
waiting……  
waiting……  
rename make make_bk   
rename make_neo make  
[in mysys]make  
generating some .a files for ffmpeg command tool……  
soon,all done!  
copy *.a to ...\android\arm\lib  
copy precompiled libx264.a to ...\android\arm\lib  
[in mysys]build_android4_so._sub.sh  
soon,all done!  
final .so(12mb) generated at \android\arm\libffmpeg.so!  
  
2018.2.11  
  
Compile log 2  
=============  
modify ffmpeg.c && ffmpeg.h  
[in mysys]make ffmpeg  
[in mysys]build_android4_so._sub.sh  
done!  
  
2018.2.11  

Compile log 3   
=============  
now using build_android.sh to build commandline tools.  
the built file /bin/ffmpeg(17mb) is executable on the termux,  
proving its ability to run on the android.   
however,it seem's to be a 32-bit one.  
performance test:  
testing……  
test file:a0.mp4(1.0mb)  
test command:ffmpeg -i a0.mp4 a.mp4  
test result(time consumed):  
i.compiled ffmpeg: 1min and 2 secs  
ii.termux's pkg ffmpeg: 22 secs  
iii.on the pc:15 secs   
……

2018.2.12  


Compile log 4   
=============  
according to http://www.ffmpeg-archive.org/Using-latest-NDK-and-ffmpeg-version-results-in-very-slow-video-processing-on-android-td4674382.html  
remove --disable-asm and rebuild libx264    
test result(time consumed):  22 secs  
done!  

2018.2.12  


Compile log 5   
=============  
1.compile openssl for https protocol
1.1 get perl-for-mingw from:https://jaist.dl.sourceforge.net/project/perl-mingw/5.24.0/perl-5.24.0-mingw32.zip
    unzip,move file to mingw folder.
1.2 compile openssl using again msys:


./Configure \
    --sysroot=$SYSROOT \
    --cross-compile-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --prefix=$PWD/dist no-idea no-mdc2 no-rc5 static android \
    
make depend && make

1.3 delete .so to link to static libs
2 compile ffmpeg.

2018.3.6






