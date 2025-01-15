# BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
#TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.


# target all means all FINAL targets currently defined in this file

gcc_Copt = -std=c99 -pedantic -g -Wimplicit-function-declaration -Wreturn-type -Wformat -c

gcc_Sopt = -lc -m64 -c -g

all: lab7.zip readrec

# this target is the .zip file that must be submitted to Carmen
lab7.zip: Makefile lab7Readme main.s readlines.s compute.s printlines.s
	zip lab7.zip Makefile lab7Readme main.s readlines.s compute.s printlines.s

# this target is for the readrec executable
# this bit_decode target gets recreated if readrec.o has changed
readrec: main.o readlines.o compute.o printlines.o
	gcc main.o readlines.o compute.o printlines.o -o readrec

# this target is the dependency for main.o
# this main.o target gets recreated if main.s has changed
main.o: main.s
	gcc $(gcc_Sopt) main.s

# this target is the dependency for readlines.o
# this readlines.o target gets recreated if readlines.s has changed
readlines.o: readlines.s
	gcc $(gcc_Sopt) readlines.s

# this target is the dependency for compute.o
# this compute.o target gets recreated if compute.s has changed
compute.o: compute.s
	gcc $(gcc_Sopt) compute.s

# this target is the dependency for printlines.o
# this printlines.o target gets recreated if printlines.s has changed
printlines.o: printlines.s
	gcc $(gcc_Sopt) printlines.s

# this target deletes all files produced from the Makefile
# so that a completely new complier of all items is required
clean:
	rm -rf *.o readrec lab7.zip