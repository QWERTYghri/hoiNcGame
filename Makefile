# Makefile for hoiNcGame
#
# The makefile outputs two versions of the compiled source.
#
#  release | debug
#
# Release is the optimized source while debug contains flags
# for gdb and other stuff.
#
# Compiled object files from includes are stored in obj
# with the same configuration for release and debug
#
# To control what output for debug or release you can comment out
# which one you want in conf.mk
#
# Target Symbols:
#
# obj : compiles includes and their c files to object files and stores 
# 	depending on conf flags
# 
# game.out : outputs the executable
#
# @QWERTYghri
#

include conf.mk

all: obj game.out

obj: ./src/public/* ./src/private/*
	$(CC) $(CFLAGS) $(OFLAGS) -c $^

game.out: ./src/main.c ./src/public/*.h
	$(CC) $(CFLAGS) $(OFLAGS) $(LIBS) -o $@ $^ *.o
clean:
	-rm -r *.out *.o
