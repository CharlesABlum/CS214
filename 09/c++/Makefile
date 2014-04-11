CFLAGS =  -c -g -Wall
LFLAGS = -Wall -g -o cppMax

cppMax: cppmax.o mylist.o
	g++ cppmax.o mylist.o  $(LFLAGS)

cppmax.o: max.cpp mylist.h
	g++ $(CFLAGS) max.cpp -o cppmax.o

mylist.o: mylist.cpp mylist.h
	g++ $(CFLAGS) mylist.cpp

clean:
	rm -f cppMax *.o *~ *#
