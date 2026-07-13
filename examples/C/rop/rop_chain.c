#include <stdio.h>

void win_chain(void) {
    printf("ROP_CHAIN_WIN\n\r");
    while (1);
}

__attribute__((naked, noinline)) void gadget_to_win(void) {
    __asm__ volatile (
        "la t0, win_chain\n"
        "mv ra, t0\n"
        "ret\n"
    );
}

__attribute__((naked, noinline)) void attack_chain(void) {
    __asm__ volatile (
        "la t0, gadget_to_win\n"
        "mv ra, t0\n"
        "ret\n"
    );
}

int main(void) {
    printf("ROP chain start\n\r");
    attack_chain();
    printf("ROP chain failed\n\r");
    return 0;
}
