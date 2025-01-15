/* BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.
*/

.file "main.s"          # name of the source file

.section .rodata        # put any read only data here

printf_line:
.string "Usage: %s filename count\n"

read_file:
.string "r"

.data                   # put anyting that should be allocated space on the heap here

.globl main
	.type main, @function           # indicates main() is function

.text                               # starts the code section

main:                               # defines a label for the function

   pushq %rbp			            # save caller's %rbp
   movq %rsp, %rbp		         # copy %rsp to %rbp so our stack frame is ready to use


   cmpl  $3, %edi                  # the value at %edi(argc) - 3

   je  success                     # if argc == 3, then jump to success

   /* if argc != 3, then fall through */

   movq    $printf_line, %rdi      # the adress of the printf string
		
   movq    (%rsi), %rsi           	    # %rsi (2nd parm for printf) = argv[0]		

   call printf                     # calling printf

   jmp exit                        # jump to exit to leave the program



   success:                         # if argc == 3, then continue from here

 /* int count = atoi(argv[2])   */

   movq 16(%rsi), %rdi              # %rdi = argv[2]

   pushq  %rsi                      # push %rsi because we need the value of argv after calling atoi

   call atoi                       # call atoi
  
   popq  %rsi

 # after this: %rax = count  
  
  /* pushing all the callee saved reg   */


   # movq    %rax, %r13              # %r13  = count ( %rax), copying count into %r13


   leaq   (%rax, %rax, 2), %r8		# %r8 = 3 * i  ( %r8 = count + (count * 3))

   shlq   $4, %r8			            # %r8 = 48 * count 

   subq     %r8, %rsp 		         # allocating space for (48 byte + count)



   
   pushq   %r13
   pushq   %r14
   pushq   %r15

   movq    %rax, %r13              # %r13  = count ( %rax), copying count into %r13

   movq     %rsp, %r15 				   # copying the base address of the structure  into %r15 ( R value)




   movq    8(%rsi), %rdi		      # fopen(argv[1])

   movq    $read_file, %rsi		# fopen(argv[1], "r")

   call fopen

/* after call fopen: (%rax) = FILE *fp   */

/*   readlines(fp, R_values, count)   */

  movq   %rax, %r14			# %r14 = adress of fp

  movq   %r14, %rdi      	# copy of fp into %rdi(1st parm)

  movq   %r15, %rsi			# copy of R_Values into 2nd parm(%rsi)

  movq	%r13, %rdx			# copy of 3rd parm(%rdx)

  call readlines

 /* call fclose(fp)  */

   movq  %r14, %rdi			# fp to 1st parm(%rdi)

   call fclose

/* call compute(R_Values, count)  */

   movq  %r15, %rdi			# R_Values to 1st parm

   movq  %r13, %rsi			# count to 2nd parm

   call compute

/* call printlines(R_Values, count)   */

   movq %r15, %rdi			# R_Values to 1st parm

   movq %r13, %rsi			# count to 2nd parm
    
   call printlines

  
 
   popq   %r15
   popq   %r14
   popq   %r13



   movq  $0x00, %rax			# exit successful

   exit:                   # label exit to leave the program 

   leave

   ret

.size main, .-main

