#include <stdio.h>

void win_nested(void) {
    printf("ROP_NESTED_WIN\n\r");
    while (1);
}

__attribute__((naked, noinline)) void leaf_attack(void) {
    __asm__ volatile (
        "la t0, win_nested\n"
        "mv ra, t0\n"
        "ret\n"
    );
}

__attribute__((noinline)) void nested_call_2(void) {
    leaf_attack();
}

__attribute__((noinline)) void nested_call_1(void) {
    nested_call_2();
}

int main(void) {
    printf("ROP nested start\n\r");
    nested_call_1();
    printf("ROP nested failed\n\r");
    return 0;
}
