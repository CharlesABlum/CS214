all: sum array_sum # threaded_array_sum

sum: sum.cpp
	g++ sum.cpp -Wall -o sum

array_sum: array_sum.cpp
	g++ array_sum.cpp -Wall -o array_sum -lrt

threaded_array_sum: threaded_array_sum.cpp
	g++ threaded_array_sum.cpp -Wall -o threaded_array_sum -fopenmp -lrt

clean:
	rm -f sum array_sum threaded_array_sum *~ *# *.o

