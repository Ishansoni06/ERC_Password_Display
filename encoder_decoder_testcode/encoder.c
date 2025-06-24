#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <correct.h>

int main() {
    char password[101] = {0};
    printf("Enter 100-character password: ");
    fgets(password, sizeof(password), stdin);

    if (strlen(password) != 100 && password[99] != '\n') {
        printf("Error: Password must be exactly 100 characters.\n");
        return 1;
    }

    // Remove newline if present
    if (password[99] == '\n') password[99] = '\0';

    uint8_t message[75] = {0};
    int bit_pos = 0;

    for (int i = 0; i < 100; ++i) {
        char c = password[i];
        uint8_t val;

        if (c >= 'A' && c <= 'Z') val = c - 'A';
        else if (c >= '0' && c <= '9') val = 26 + (c - '0');
        else val = 0;

        int byte_index = bit_pos / 8;
        int bit_offset = bit_pos % 8;

        message[byte_index] |= val << bit_offset;
        if (bit_offset > 2)
            message[byte_index + 1] |= val >> (8 - bit_offset);

        bit_pos += 6;
    }

    uint8_t encoded[128] = {0};
    correct_reed_solomon *rs = correct_reed_solomon_create(0x11D, 0, 1, 53);
    correct_reed_solomon_encode(rs, message, 75, encoded);
    correct_reed_solomon_destroy(rs);

    printf("Encoded data (hex):\n");
    for (int i = 0; i < 128; ++i)
        printf("%02X ", encoded[i]);
    printf("\n");

    return 0;
}
