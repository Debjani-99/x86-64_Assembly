/* BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE 
TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.
*/


.file "rotate_right.s"			# name of the source file


.globl rotate_right
	.type	rotate_right, @function	# indicates rotate_right() is function

.text					# starts the code section


rotate_right:				# defines a label for the function

pushq		%rbp			# save the base pointer
movq		%rsp, %rbp		# copy %rsp to %rbp to set up stack pointer

movb		%dil, %al		# copy the input value into the lower byte of return value(%rax), [%dil = 1st arg, %al = return value]

movb 		%al, %r8b		# copy the %al into a caller saved reg lower bit of %r8, [ %r8b has the return value now (temp)]

andb		$1, %r8b		# ( %r8b & 0x01 ) = value & 0x01 [ temp  = value & 0x01]

shrb		$1, %al			# logical right shift by 1 bit ( value = value >> 1 ) [ %al is our return value, which has the input value (%dil) ]

salb		$7, %r8b		# left shift by 7 bit, makes the LSB to MSB

orb		%r8b, %al		# %al = %al | %r8b [ value = value | bit ]

# dont need the caller saved reg value, hence, no need to push it in the stack 

movzbl		%al, %eax		# zero extended for unsigned char return value 

leave

ret

.size rotate_right, .-rotate_right






					
 
	
