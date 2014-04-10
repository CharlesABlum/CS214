# Makefile for GNAT (Ada) version of split.
TARGET = split

PATH = /usr/local/ada/
BIN = $(PATH)bin/
LIB = $(PATH)lib/
CC = $(BIN)gcc
CFLAGS = -c -I$(LIB)gcc-lib/sparc-sun-solaris2.5.1/2.8.1/adainclude -B$(BIN) -gnatf
BFLAGS = -I$(LIB)gcc-lib/sparc-sun-solaris2.5.1/2.8.1/adalib/
LFLAGS = --GCC=$(CC) -B/usr/local/ada/lib/gcc-lib/sparc-sun-solaris2.5.1/2.8.1/

$(TARGET): $(TARGET).ali

	$(BIN)gnatbind $(BFLAGS) $(TARGET).ali

	$(BIN)gnatlink $(LFLAGS) $(TARGET).ali

	/usr/bin/rm -f $(TARGET).ali $(TARGET).c

$(TARGET).ali: $(TARGET).adb

	$(CC) $(CFLAGS) $(TARGET).adb

clean:
	/usr/bin/rm -f $(TARGET) *~ *# *.o *.ali


