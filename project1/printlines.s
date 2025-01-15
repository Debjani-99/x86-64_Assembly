/* BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.
*/

.file "printlines.s"
# Assembler directives to allocate storage for static array

.section .rodata                    # put any read only data here

printf_line1:
.string "Results for entry %d:\n"

printf_line2:
.string "(%d) + (%d) = (%ld)\n"

printf_line3:
.string "(%d) - (%d) = (%ld)\n"

printf_line4:
.string "(%d) * (%d) = (%ld)\n"

printf_line5:
.string "(%d) / (%d) = (%d), (%d)\n"


.data                               # put anyting that should be allocated space on the heap here

.globl printlines
	.type printlines, @function

.text 

printlines:

    pushq %rbp			# save caller's %rbp
    movq %rsp, %rbp		# copy %rsp to %rbp so our stack frame is ready to use


    pushq  %r13
    pushq  %r14
    pushq  %r15

 /* void printlines(struct Record *rptr, int count)  */

    movq    %rdi, %r13                  # copy of rptr into %r13
    movl    %esi, %r14d                 # copy of count into %r14d

    movl    $1, %r15d                    # %r15d = 1 -> int i = 1

loopPrintline:                          # loop 

    /* check if count > 0 */

    cmpl    $0, %r14d               # %r14d - 0

    jle     exit                    # if count <= 0, then jump to exit

/* printf("Results for entry %d:\n", i++);    */

    movl    %r15d, %esi                  # copy of int i into 2nd parm (%esi)

    movq    $printf_line1, %rdi          # address of the string 
    movq    $0, %rax                    # setting %rax to 0 before calling printf

    call printf
    
    incl    %r15d                        # i++



/* printf("(%d) + (%d) = (%ld)\n", rptr->value1,rptr->value2,rptr->sum);   */

    movl    4(%r13), %esi                # value of rptr->value1 into %esi(2nd parm)
    movl    (%r13), %edx                 # value of rptr->value2 into %edx(3rd parm)

    movq    24(%r13), %rcx               # value of rptr->sum into %rcx(4th parm)

    movq    $printf_line2, %rdi          # address of the string 
    movq    $0, %rax                    # setting %rax to 0 before calling printf

    call printf

/* printf("(%d) - (%d) = (%ld)\n", rptr->value1,rptr->value2,rptr->difference);   */

    movl    4(%r13), %esi                # value of rptr->value1 into %esi(2nd parm)
    movl    (%r13), %edx                 # value of rptr->value2 into %edx(3rd parm)

    movq    8(%r13), %rcx               # value of rptr->difference into %rcx(4th parm)

    movq    $printf_line3, %rdi          # address of the string 
    movq    $0, %rax                    # setting %rax to 0 before calling printf

    call printf

/* printf("(%d) * (%d) = (%ld)\n", rptr->value1,rptr->value2,rptr->product);    */

    movl    4(%r13), %esi                # value of rptr->value1 into %esi(2nd parm)
    movl    (%r13), %edx                 # value of rptr->value2 into %edx(3rd parm)

    movq    40(%r13), %rcx               # value of rptr->product into %rcx(4th parm)

    movq    $printf_line4, %rdi          # address of the string 
    movq    $0, %rax                    # setting %rax to 0 before calling printf

    call printf

/* printf("(%d) / (%d) = (%d), (%d)\n", rptr->value1,rptr->value2,rptr->quotient, rptr->remainder);   */

    movl    4(%r13), %esi                # value of rptr->value1 into %esi(2nd parm)
    movl    (%r13), %edx                 # value of rptr->value2 into %edx(3rd parm)

    movl    16(%r13), %ecx                # value of rptr->quotient into %ecx (4th parm)
    movl    32(%r13), %r8d                # value of rptr->remainder into %r8d(5th parm)

    movq    $printf_line5, %rdi          # address of the string 
    movq    $0, %rax                    # setting %rax to 0 before calling printf

    call printf


    addq    $48, %r13       # ++rptr (move rptr to the next struct)

    decl    %r14d           # --count

jmp loopPrintline                 # go back to the loop

    exit:

    popq    %r15
    popq    %r14
    popq    %r13


    leave
    ret
.size printlines, .-printlines
