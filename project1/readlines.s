/* BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.
*/

.file "readlines.s"

# Assembler directives to allocate storage for static array

.section .rodata            # put any read only data here

scanf_line:
.string "%d %d"

.data                       # put anyting that should be allocated space on the heap here

.globl readlines
	.type readlines, @function

.text

readlines:
    pushq %rbp			# save caller's %rbp
    movq %rsp, %rbp		# copy %rsp to %rbp so our stack frame is ready to use

pushq  %r12
pushq  %r13
pushq  %r14

/* void readlines(FILE *fp, struct Record *rptr, int count)   */

movq    %rdi, %r12      # copy fp into %r12
movq    %rsi, %r13      # copy rptr into %r13
movl    %edx, %r14d     # copy count

# movq    $0, %rax        

loop:                      

/* check if count > 0 */

cmpl    $0, %r14d               # %r14d - 0

jle       out                  # if count <= 0, then jump to out

/* setting up for fscanf: fscanf(fp, "%d %d", &(rptr->value1), &(rptr->value2)) */


movq    %r12, %rdi           # copy of fp into 1st parm (%rdi)

leaq    4(%r13), %rdx       # address of rptr->value1  into 3nd parm (%rdx): "%d"  # could also be leaq, dont know yet!
leaq    (%r13), %rcx        # address of rptr->value2  into 4th parm (%rcx): "%d"

movq    $scanf_line, %rsi    # address of the string


call fscanf

decl    %r14d           # --count

addq    $48, %r13       # ++rptr (move rptr to the next struct)

jmp loop                 # go back to the loop

out:

popq    %r14
popq    %r13
popq    %r12

    leave
    ret

.size readlines, .-readlines