#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <correct.h>

int main() {
    uint8_t encoded[128];
    printf("Enter 128 encoded bytes in hex (space separated):\n");

    for (int i = 0; i < 128; ++i) {
        unsigned int val;
        if (scanf("%x", &val) != 1) {
            printf("Invalid input. Please enter hex bytes.\n");
            return 1;
        }
        encoded[i] = (uint8_t)val;
    }

    uint8_t decoded[75] = {0};
    correct_reed_solomon *rs = correct_reed_solomon_create(0x11D, 0, 1, 53);
    int result = correct_reed_solomon_decode(rs, encoded, 128, decoded);
    correct_reed_solomon_destroy(rs);

    if (result != 75) {
        printf("Decoding failed or incorrect data.\n");
        return 1;
    }

    printf("Decoded password:\n");
    int bit_pos = 0;
    for (int i = 0; i < 100; ++i) {
        int byte_index = bit_pos / 8;
        int bit_offset = bit_pos % 8;

        uint8_t val = (decoded[byte_index] >> bit_offset) & 0x3F;
        if (bit_offset > 2)
            val |= (decoded[byte_index + 1] << (8 - bit_offset)) & 0x3F;

        char out;
        if (val < 26) out = 'A' + val;
        else if (val < 36) out = '0' + (val - 26);
        else out = '?';

        printf("%c", out);
        bit_pos += 6;
    }
    printf("\n");

    return 0;
}
