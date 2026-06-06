#include <stdio.h>

static volatile int sink;

__attribute__((noinline)) int add_one(int x) {
    return x + 1;
}

__attribute__((noinline)) int mul_two(int x) {
    return x * 2;
}

__attribute__((noinline)) int dispatch(int (*fn)(int), int x) {
    int y = fn(x);
    sink += y;
    return y + 3;
}

int main(void) {
    int (*table[2])(int) = {add_one, mul_two};
    int a = dispatch(table[0], 10);
    int b = dispatch(table[1], 11);

    if (a == 14 && b == 25) {
        printf("SSTACK_ABI_INDIRECT_NORMAL_PASS\n\r");
        return 0;
    }

    printf("SSTACK_ABI_INDIRECT_NORMAL_FAIL %d %d\n\r", a, b);
    return 1;
}
