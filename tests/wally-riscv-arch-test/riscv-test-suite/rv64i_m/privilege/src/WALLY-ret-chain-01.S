///////////////////////////////////////////
//
// WALLY-ret-chain
//
// Test a tight chain of returns.
//
///////////////////////////////////////////

#include "WALLY-TEST-LIB-64.h"

RVTEST_ISA("RV64I_Zicsr")
RVTEST_CASE(0,"//check ISA:=regex(.*64.*);check ISA:=regex(.*I.*);def TEST_CASE_1=True;def NO_SAIL=True;",ret-chain)

INIT_TESTS

TRAP_HANDLER m, EXT_SIGNATURE=1

li t0, 0
la t2, ret_chain_0
jr t2

ret_chain_0:
    addi t0, t0, 1
    la ra, ret_chain_1
    ret
ret_chain_1:
    addi t0, t0, 1
    la ra, ret_chain_2
    ret
ret_chain_2:
    addi t0, t0, 1
    la ra, ret_chain_3
    ret
ret_chain_3:
    addi t0, t0, 1
    la ra, ret_chain_4
    ret
ret_chain_4:
    addi t0, t0, 1
    la ra, ret_chain_5
    ret
ret_chain_5:
    addi t0, t0, 1
    la ra, ret_chain_6
    ret
ret_chain_6:
    addi t0, t0, 1
    la ra, ret_chain_7
    ret
ret_chain_7:
    addi t0, t0, 1
    la ra, ret_chain_8
    ret
ret_chain_8:
    addi t0, t0, 1
    la ra, ret_chain_9
    ret
ret_chain_9:
    addi t0, t0, 1
    la ra, ret_chain_10
    ret
ret_chain_10:
    addi t0, t0, 1
    la ra, ret_chain_11
    ret
ret_chain_11:
    addi t0, t0, 1
    la ra, ret_chain_12
    ret
ret_chain_12:
    addi t0, t0, 1
    la ra, ret_chain_13
    ret
ret_chain_13:
    addi t0, t0, 1
    la ra, ret_chain_14
    ret
ret_chain_14:
    addi t0, t0, 1
    la ra, ret_chain_15
    ret
ret_chain_15:
    addi t0, t0, 1
    la ra, ret_chain_done
    ret

ret_chain_done:
    li t3, 16
    li t4, 0xbad
    bne t0, t3, ret_chain_store
    li t4, 0x600d

ret_chain_store:
    sd t4, 0(t1)
    addi t1, t1, 8
    addi a6, a6, 8

END_TESTS

TEST_STACK_AND_DATA
