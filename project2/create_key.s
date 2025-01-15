/* BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.
*/

.file "create_key"			# name of the source file

.section .rodata

PR_1:					# printf("Enter 4 digit key: \n")
	.string "Enter 4 digits( 0 or 1) key: \n"

.globl create_key
	.type	create_key, @function	# indicates create_key() is function

.text					# starts the code section


create_key:				# defines a label for the function

pushq		%rbp			# save the base pointer
movq		%rsp, %rbp		# copy %rsp to %rbp to set up stack frame

movq		$0, %rax		# %rax should be zero beofre call to printf (also, initialized key to store digit)

movq		$PR_1, %rdi		# copying the address of 1st parm(printf string) and storing it into the reg

call		printf

call		getchar			# now getchar() has the value that we want in digit ( digit = getchar(); )
					# this reads the first digit ( 0 or 1)

pushq		%r12			# callee saved reg

movl		$0x00, %r12d		# setting  temp reg = 0x00 ( key)

cmpl		 $'0', %eax		#  %eax  - '0'

je		forzero1

orl		$1, %r12d		# key = key |  1



forzero1:

sall		$1, %r12d			# key = key << 1

													
											

call getchar					# 2nd digit (input value)

cmpl		$'0', %eax			

je		forzero2

orl		$1, %r12d


forzero2:

sall		$1, %r12d


call getchar					# 3rd digit 

cmpl		$'0', %eax

je		forzero3

orl		$1, %r12d

forzero3:

sall		$1, %r12d


call getchar					# 4th digit

cmpl		 $'0', %eax

je 		forzero4

orl		$1, %r12d


forzero4:


# duplicate 4-bit into 8-bit

movq		$0x00, %rax			# set %rax to 0

orl		%r12d, %eax			

sall		$4, %r12d

orl		%r12d, %eax

popq		%r12

leave

ret

.size		create_key, .-create_key










