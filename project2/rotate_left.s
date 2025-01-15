/* BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE
TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY.
*/

.file "rotate_left.s"			# name of the source file

.globl rotate_left
	.type	rotate_left, @function	# indicates rotate_left() is function

.text					# starts the code section


rotate_left:				# defines a label for the function

pushq		%rbp			# save the base pointer
movq		%rsp, %rbp		# copy %rsp to %rbp to set up stack frame

movb		%dil, %al		# copy the arg value into the lower bit of return value

movb		%al, %r8b		# copy the retrun value into %r8b, which is 'bit' from  C

andb		$0x80, %r8b		# ( %r8b = %r8b & 0x80, set 'bit' equal to msb) [ bit = value & 0x80 ]

shlb		$1, %al			# value = value << 1 (%al is the return value)

shrb		$7, %r8b		# make LSB the MSB ( bit = bit >> 7)

orb		%r8b, %al		# put LSB in value ( %al = %al | %r8b )

movzbl		%al, %eax		# zero extended for unsigned char return value

leave

ret

.size rotate_left, .-rotate_left


