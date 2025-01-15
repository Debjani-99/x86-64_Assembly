
BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE TENURES OF
THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.

THIS IS THE README FILE FOR LAB 6.

NAME: Debjani Hill

Total amount of time (effort) it took for you to comeplete the lab: 6 hours

Interesting problem:
I had an interesting issue where I had a shll after reading the 4th digit,
which was shifting the right key into a different value. After using gdb and going to the office hour, i realized that i didnt need to use the last shift as i already had the right key value(0x6). the function can just fall through the jump and move on to the duplicating the 4 digit key into a 8 digit key (0x66)

Using gdb to find bug in the program: break main then step for create key, rotate right, rotate left
I had a bug where i was using bitwise or with a wrong suffix (orb) when duplicating the 8 digit key, hence i was getting some unreadable characters in retrun. when checked the value of the %rax register and it wasnt 0x66.
First, i checked the vlaue of %r12, and i noticed it wasnt 0x60 after shifting by 1 bit, realized i was doing something wrong while duplicating. using l sufix fixed the issue.

