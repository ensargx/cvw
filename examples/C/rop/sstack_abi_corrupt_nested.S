  .section .rodata
start_msg:
  .string "SSTACK_CORRUPT_NESTED_START\n\r"
win_msg:
  .string "SSTACK_CORRUPT_NESTED_WIN\n\r"
fail_msg:
  .string "SSTACK_CORRUPT_NESTED_FAIL\n\r"

  .section .text
  .globl main
  .type main, @function
main:
  addi sp, sp, -16
  sd ra, 8(sp)

  la a0, start_msg
  call printf
  call outer_call

  la a0, fail_msg
  call printf
  li a0, 1
  call exit

  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size main, .-main

  .globl outer_call
  .type outer_call, @function
outer_call:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd s0, 0(sp)
  addi s0, sp, 16

  call inner_corrupt

  ld s0, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size outer_call, .-outer_call

  .globl inner_corrupt
  .type inner_corrupt, @function
inner_corrupt:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd s0, 0(sp)
  addi s0, sp, 16

  la t0, forbidden_target
  sd t0, 8(sp)

  ld s0, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size inner_corrupt, .-inner_corrupt

  .globl forbidden_target
  .type forbidden_target, @function
forbidden_target:
  la a0, win_msg
  call printf
  li a0, 67
  call exit
1:
  j 1b
  .size forbidden_target, .-forbidden_target
