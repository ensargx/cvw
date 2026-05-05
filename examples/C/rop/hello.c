#include <stdio.h>

/* example function which is not supposed to be called */
void win() {
    printf("PoC\n\r");
    while (1); /* since 'ra' register has the address of this function */
               /* every 'ret' will call this function again which will */
               /* loop forever. */
}

void memcpy_(char *src, char *target, int size) {
    int i = 0;
    while (i < size) {
        target[i++] = *src++;
    }
}

void memcpy_vuln(char *target) {
    /* example payload for buffer overflow */
    /* 0x800001c6 is the address of the win function */
    /* make sure 'ra' register gets overriten by this address */
    memcpy_("AAAAAAAABBBBBBBBDDDDDDDD\xc6\x01\x00\x80\x00\x00\x00\x00", target, 32);
}

int main() {
    /* 16 bytes of buffer */
    char arr[16];

    printf("Hello RISC-V (UART)!\n\r");
    /* arbitary size of input */
    memcpy_vuln(arr);

    return 0;
}
