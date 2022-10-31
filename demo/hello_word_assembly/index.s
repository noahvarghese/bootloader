# 32 bit
.global _start        # tell linker that this should be exposed

.text
_start:
    movl    $1,%ebx         # file descriptor (std out)
    movl    $4,%eax         # write sys call (https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md)
    movl    msg_len,%edx
    movl    $msg,%ecx
    int     $0x80           # call kernel with interrupt

    mov     $1, %ax         # exit program sys call
    mov     $0, %bx
    int     $0x80
.data
    msg:        .ascii "Hello world!\n"
    msg_len:    .byte (. - msg)
