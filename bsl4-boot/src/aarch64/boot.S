.text
.globl _load_stack_ptr_jmp
_load_stack_ptr_jmp:
    msr msp, 1 /* Load r1 () into MSP (for loading immediate or register data into system registers). */
    bx r0 /* Branch to the address at r0. */
