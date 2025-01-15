/* BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.
*/

.file "compute.s"
# Assembler directives to allocate storage for static array

.section .rodata                    # put any read only data here


.data                               # put anyting that should be allocated space on the heap here

.globl compute
	.type compute, @function

.text 

compute:

    pushq %rbp			# save caller's %rbp
    movq %rsp, %rbp		# copy %rsp to %rbp so our stack frame is ready to use

   /* void compute(struct Record *rptr, int count)  */

    pushq  %r13
    pushq  %r14

    movq    %rdi, %r13                  # copy of rptr into %r13
    movl    %esi, %r14d                 # copy of count into %r14d

loopCompute:

    /* while(count > 0):  check if count > 0  */

    cmpl    $0, %r14d                   # %r14d - 0

    jle exit_loop                       # if count <= 0, jump to exit_loop


    /* rptr->sum = (long)rptr->value1 + (long)rptr->value2;   */

    movl    4(%r13), %edi               # %edi = value of rptr->value1

    movslq  %edi, %rdi                  # %rdi got extended with the value of MSB for long(rptr->value1)

    movl    (%r13), %esi                # %esi = value of rptr->value2

    movslq  %esi, %rsi                  # %rsi got extended with the value of MSB for long(rptr->value2) 
 
    addq    %rdi, %rsi                  # %rsi = (long)rptr->value1 + (long)rptr->value2

    movq    %rsi, 24(%r13)              # 24(%rax) = result of the sum 


    /* rptr->difference = (long)rptr->value1 - (long)rptr->value2;   */

    movl    4(%r13), %edi               # %edi = value of rptr->value1

    movslq  %edi, %rdi                  # %rdi got extended with the value of MSB for long(rptr->value1)  

    movl    (%r13), %esi                # %esi = value of rptr->value2

    movslq  %esi, %rsi                  # %rsi got extended with the value of MSB for long(rptr->value2)

    subq    %rsi, %rdi                  # %rsi = (long)rptr->value1 - (long)rptr->value2
  
    movq    %rdi, 8(%r13)               # 8(%r13) = result of the difference


    /* rptr->product = (long)rptr->value1 * (long)rptr->value2;  */

    movl    4(%r13), %edi               # %edi = value of rptr->value1 (X)

    movslq  %edi, %rdi                  # %rdi got extended with the value of MSB for long(rptr->value1)

    movl    (%r13), %esi                # %esi = value of rptr->value2 (Y)

    movslq  %esi, %rsi                  # %rsi got extended with the value of MSB for long(rptr->value2)

    movq    %rdi, %rax                  # %rax = value of X ( value1)

    movq    %rsi, %rdx                  # %rdx = value of y (value2)

    imulq    %rdx                       # Multiply by y

    movq     %rax, 40(%r13)             # Store lower 8 bytes at dest(rptr->product)

    # movq     %rdx, 48(%r13)              # Store upper 8 bytes at dest+8



    /* rptr->quotient = rptr->value1/rptr->value2;      */

    /* rptr->remainder = rptr->value1 % rptr->value2;    */

    movl    4(%r13), %edi               # %edi = value of rptr->value1 (X)

    movl    (%r13), %esi                # %esi = value of rptr->value2 (Y)

    movl    %edi, %eax                  # %eax = Move x to lower 4 bytes of dividend

    cltq                                # sign-extend to upper 4 bytes of dividend

    cqto                                # sign-extend to %edx

    idivl %esi                          # Divide by y

    /* now, %rax = x/y (q), and %rdx = x%y (r)   */

    movl    %eax, 16(%r13)              # Store quotient 

    movl    %edx, 32(%r13)              # store remainder


    
    addq    $48, %r13       # ++rptr (move rptr to the next struct)

    decl    %r14d           # --count


    jmp loopCompute                     # go back to the loop 

    exit_loop:

    popq    %r14
    popq    %r13

    leave
    ret
.size compute, .-compute
