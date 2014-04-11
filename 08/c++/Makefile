
CFLAGS = -c -Wall
LFLAGS = -o namer
namer: namer.o Name.o
	g++ namer.o Name.o $(LFLAGS)

namer.o: namer.cpp Name.h
	g++ $(CFLAGS) namer.cpp

Name.o: Name.cpp Name.h
	g++ $(CFLAGS) Name.cpp

clean:
	rm -f namer *~ *# *.o

