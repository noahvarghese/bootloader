.global _start

.text
_start:
  movl $0x0e41, %eax # sets AH to 0xe (function teletype) and al to 0x41 (ASCII "A")
  int $0x10 # call the function in ah from interrupt 0x10
  hlt # stops executing

/* MBR boot signature */
.org    510     # start at the 510th byte
.word   0xaa55  # Write this value to the 511th and 512th bytes
