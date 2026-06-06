#include <stdio.h>

static volatile int sink;

__attribute__((noinline)) int leaf_call(int x) {
    return x + 1;
}

__attribute__((noinline)) int nested_call_3(int x) {
    int y = leaf_call(x);
    sink += y;
    return y + 3;
}

__attribute__((noinline)) int nested_call_2(int x) {
    int y = nested_call_3(x + 2);
    sink += y;
    return y + 5;
}

__attribute__((noinline)) int nested_call_1(int x) {
    int y = nested_call_2(x + 4);
    sink += y;
    return y + 7;
}

__attribute__((noinline)) int recurse_bounded(int depth, int acc) {
    if (depth == 0) return acc;
    int y = recurse_bounded(depth - 1, acc + depth);
    sink += y;
    return y + 1;
}

__attribute__((noinline)) int indirect_target(int x) {
    return x * 3 + 1;
}

__attribute__((noinline)) int call_indirect(int (*fn)(int), int x) {
    int y = fn(x);
    sink += y;
    return y + 9;
}

int main(void) {
    int total = 0;

    total += leaf_call(10);
    total += nested_call_1(1);
    total += recurse_bounded(16, 0);
    total += call_indirect(indirect_target, 7);

    if (total == 217) {
        printf("SSTACK_ABI_NORMAL_PASS\n\r");
        return 0;
    }

    printf("SSTACK_ABI_NORMAL_FAIL %d\n\r", total);
    return 1;
}
