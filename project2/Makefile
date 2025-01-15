# target all means all FINAL targets currently defined in this file

gcc_Copt = -std=c99 -pedantic -g -Wimplicit-function-declaration -Wreturn-type -Wformat -c

gcc_Sopt = -lc -m64 -c -g

all: lab6.zip bit_decode

# this target is the .zip file that must be submitted to Carmen
lab6.zip: Makefile lab6Readme bit_decode.c create_key.s rotate_right.s rotate_left.s
	zip lab6.zip Makefile lab6Readme bit_decode.c create_key.s rotate_right.s rotate_left.s

# this target is for the bit_decode executable
# this bit_decode target gets recreated if bit_decode.o has changed
bit_decode: bit_decode.o create_key.o rotate_right.o rotate_left.o
	gcc bit_decode.o create_key.o rotate_right.o rotate_left.o -o bit_decode

# this target is the dependency for bit_decode.o
# the bit_decode.o target gets recreated if bit_decode.c has changed
bit_decode.o: bit_decode.c
	gcc $(gcc_Copt) bit_decode.c

# this target is the dependency for create_key.o
# this create_key.o target gets recreated if create_key.s has changed
create_key.o: create_key.s
	gcc $(gcc_Sopt) create_key.s

# this target is the dependency for rotate_right.o
# this rotate_right.o target gets recreated if rotate_right.s has changed
rotate_right.o: rotate_right.s
	gcc $(gcc_Sopt) rotate_right.s

# this target is the dependency for rotate_left.o
# this rotate_left.o target gets recreated if rotate_left.s has changed
rotate_left.o: rotate_left.s
	gcc $(gcc_Sopt) rotate_left.s

# this target deletes all files produced from the Makefile
# so that a completely new complier of all items is required
clean:
	rm -rf *.o bit_decode lab6.zip
