BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE TENURES OF
THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.

THIS IS THE README FILE FOR LAB 7.

NAME: Debjani Hill

Total amount of time (effort) it took for you to comeplete the lab: 10

problems:

first problem was my index i for "printf("Results for entry %d:\n", i++)" wasn't working, I was getting 1 for the first entry, and
then 0 for the rest.
i used gdb to break printlines and then i break line 60, then i realized that i was incrementing %esi instead of %r15d to increment i.
when i did tui reg general, i noticed that after calling printf, %esi had 0, and thats why it was not wokring. 

Second issue was i was trying to store the upper 8 byte value in the 8 past the destionation location, but here we are dealing 64 bit 
value not a 128 bit value like we saw in the slides. I had to go to the office hour to realize what i was doing wrong here.

The main issue was i was storing  the result of difference here:
"movq    %rdi, 8(%r13)               # 8(%r13) = result of the difference", which is correct but then i was also rewriting this value
later on. i used gdb to step into this part of the program, in tui reg general i noticed that even though i had the right value for 
difference, i was overwriting it later on and thats why i was getting the wrong result. 
Also, i had my %rdi, %rsi flipped for computing difference, but i didnt need gdb for this to figure that out. 

Overall, i had fun doing this lab.