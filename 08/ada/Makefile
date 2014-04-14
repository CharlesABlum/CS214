# Makefile for GNAT (Ada) compilation

TARGET = namer
PACKAGE = name_package

CC = gcc
CFLAGS = -c -gnata

$(TARGET): $(TARGET).ali $(PACKAGE).o
	gnatbind $(TARGET).ali
	gnatlink $(TARGET).ali

$(TARGET).ali: $(TARGET).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(TARGET).adb

$(PACKAGE).o: $(PACKAGE).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(PACKAGE).adb

clean:
	rm -f $(TARGET) *~ *# *.o *.ali *.c

