#include <stdio.h>

void win_direct(void) {
    printf("ROP_DIRECT_WIN\n\r");
    while (1);
}

__attribute__((naked, noinline)) void attack_direct(void) {
    __asm__ volatile (
        "la t0, win_direct\n"
        "mv ra, t0\n"
        "ret\n"
    );
}

int main(void) {
    printf("ROP direct start\n\r");
    attack_direct();
    printf("ROP direct failed\n\r");
    return 0;
}
