CC = g++
CFLAGS = -Wall -Iinclude
SRC = src/main.cpp src/calculator.cpp
OBJ = $(SRC:.cpp=.o)
TARGET = main
LIB = libcalculator.a

all: $(TARGET)

$(LIB): src/calculator.o
	$(AR) rcs $@ $^

$(TARGET): $(OBJ) $(LIB)
	$(CC) $(CFLAGS) -o $@ $(OBJ) -L. -lcalculator

src/main.o: src/main.cpp
	$(CC) $(CFLAGS) -c $< -o $@

src/calculator.o: src/calculator.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	del $(subst /,\,$(OBJ)) $(TARGET) $(LIB)

.PHONY: clean all