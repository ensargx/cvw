  .section .rodata
start_msg:
  .string "SSTACK_RET5_CORRUPT_START\n\r"
win_msg:
  .string "SSTACK_RET5_CORRUPT_WIN\n\r"
fail_msg:
  .string "SSTACK_RET5_CORRUPT_FAIL\n\r"

  .section .text
  .globl main
  .type main, @function
main:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd s0, 0(sp)
  addi s0, sp, 16

  la a0, start_msg
  call printf
  call f1

  la a0, fail_msg
  call printf
  li a0, 1
  call exit

  ld s0, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size main, .-main

  .globl f1
  .type f1, @function
f1:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd s0, 0(sp)
  addi s0, sp, 16

  call f2

  ld s0, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size f1, .-f1

  .globl f2
  .type f2, @function
f2:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd s0, 0(sp)
  addi s0, sp, 16

  call f3

  ld s0, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size f2, .-f2

  .globl f3
  .type f3, @function
f3:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd s0, 0(sp)
  addi s0, sp, 16

  call f4

  ld s0, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size f3, .-f3

  .globl f4
  .type f4, @function
f4:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd s0, 0(sp)
  addi s0, sp, 16

  call f5

  ld s0, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size f4, .-f4

  .globl f5
  .type f5, @function
f5:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd s0, 0(sp)
  addi s0, sp, 16

  la t0, forbidden_target
  sd t0, 8(s0)

  ld s0, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size f5, .-f5

  .globl forbidden_target
  .type forbidden_target, @function
forbidden_target:
  la a0, win_msg
  call printf
  li a0, 68
  call exit
1:
  j 1b
  .size forbidden_target, .-forbidden_target
