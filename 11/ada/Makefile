all: array_sum # tasked_array_sum


tasked_array_sum: tasked_array_sum.adb
	gnatmake tasked_array_sum.adb

array_sum: array_sum.adb
	gnatmake array_sum.adb

clean:
	rm -f *~ *# *.o *.ali tasked_array_sum array_sum

