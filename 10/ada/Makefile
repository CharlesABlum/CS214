# Makefile for GNAT (Ada) compilation
#  for a 3-level class hierarchy

TARGET = birds
FLYINGSPECIES = duck_package.ali goose_package.ali owl_package.ali
WALKINGSPECIES =  kiwi_package.ali penguin_package.ali ostrich_package.ali
BIRDTYPE =  flyingbird_package.ali walkingbird_package.ali
PACKAGES = bird_package.ali $(FLYINGSPECIES) $(WALKINGSPECIES) $(BIRDTYPE)

BIN = /usr/bin/
CC = $(BIN)gcc
CFLAGS = -c 

.SUFFIXES:
.SUFFIXES: .adb .ads                  # ada package body & spec.

$(TARGET): $(TARGET).ali $(PACKAGES)  # link target & packages
	$(BIN)gnatbind $(TARGET).ali
	$(BIN)gnatlink $(TARGET).ali

$(TARGET).ali: $(TARGET).adb          # compile target (w/o .ads)
	$(CC) $(CFLAGS) $<

%.ali : %.adb %.ads                   # compile packages (w .ads)
	$(CC) $(CFLAGS) $<

$(BIRDTYPE) : bird_package.ads     	    # subclasses depend on superclass
$(FLYINGSPECIES) : flyingbird_package.ads   
$(WALKINGSPECIES) : walkingbird_package.ads 

clean:
	/bin/rm -f $(TARGET) *~ *# *.o *.ali *.c


