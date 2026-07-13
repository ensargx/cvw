  .section .rodata
pass_msg:
  .string "SSTACK_ABI_RET5_NORMAL_PASS\n\r"

  .section .text
  .globl main
  .type main, @function
main:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd s0, 0(sp)
  addi s0, sp, 16

  call f1

  la a0, pass_msg
  call printf
  li a0, 0
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

  ld s0, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .size f5, .-f5
