NAME = Launcher

ifeq ($(OS),Windows_NT)
	FLAGS = -std=c++98 -Wl,-subsystem,windows -mwindows
	LIBS = -L/lib -lfltk -lole32 -luuid -lcomctl32 -lws2_32
	OUT = ${NAME}.exe
else
	LIBS = -lfltk -lX11 -lm
	OUT = ${NAME}.elf
endif

CXX = g++
OBJS = ${NAME}.cpp

exe:${OBJ}
	${CXX} ${FLAGS} -o ${OUT} ${OBJS} ${LIBS}

clean:
	-rm *.elf *.exe

.cpp.o:
	${CXX} ${FLAGS} ${INCLUDES} -c $<
