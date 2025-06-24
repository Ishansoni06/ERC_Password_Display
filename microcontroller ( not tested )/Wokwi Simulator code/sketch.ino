// --- Full Sketch: ESP32 with Real RS(128,75) Encoding + NeoPixel Display ---

#include <Adafruit_NeoPixel.h>
#include <stdint.h>
#include <string.h>

#define PIN_WS2812B 26
#define NUM_PIXELS 256
#define WIDTH 16
#define HEIGHT 16

Adafruit_NeoPixel matrix(NUM_PIXELS, PIN_WS2812B, NEO_GRB + NEO_KHZ800);

const char password[101] = "JRIGEIGUEIGEIRNGEJRGEOOGENBNOERNBNEROIBEONBIOEHOIEJGIENROINVEONKNOENNEORBNENRBOENB923579024709276274";

uint8_t message[75] = {0};      // Packed 6-bit data
uint8_t encoded[128] = {0};     // RS(128,75) encoded output

// GF(256) parameters for RS
const uint8_t rs_generator[53] = {
  1, 0, 25, 54, 120, 131, 171, 4, 97, 197,
  64, 31, 27, 113, 159, 94, 70, 18, 210, 36,
  224, 56, 98, 73, 215, 254, 119, 41, 12, 28,
  208, 48, 180, 11, 42, 76, 108, 183, 85, 160,
  38, 104, 195, 5, 89, 202, 246, 167, 78, 165,
  144, 131, 240
};

uint8_t gf_mul(uint8_t a, uint8_t b) {
  uint8_t p = 0;
  for (int i = 0; i < 8; i++) {
    if (b & 1) p ^= a;
    bool carry = a & 0x80;
    a <<= 1;
    if (carry) a ^= 0x1D;  // Primitive poly x^8 + x^4 + x^3 + x^2 + 1 (0x11D), stripped high bit
    b >>= 1;
  }
  return p;
}

void reedSolomonEncode(uint8_t *msg, uint8_t *out) {
  memcpy(out, msg, 75);
  memset(out + 75, 0, 53);
  for (int i = 0; i < 75; ++i) {
    uint8_t coef = out[i];
    if (coef != 0) {
      for (int j = 0; j < 53; ++j) {
        out[i + j + 1] ^= gf_mul(rs_generator[j], coef);
      }
    }
  }
  memcpy(out, msg, 75); // Preserve message bytes in front
}

void encodePassword(const char* pw, uint8_t* out_msg) {
  int bit_pos = 0;
  for (int i = 0; i < 100; ++i) {
    char c = pw[i];
    uint8_t val;
    if (c >= 'A' && c <= 'Z') val = c - 'A';
    else if (c >= '0' && c <= '9') val = 26 + (c - '0');
    else val = 0;
    int byte_index = bit_pos / 8;
    int bit_offset = bit_pos % 8;
    out_msg[byte_index] |= val << bit_offset;
    if (bit_offset > 2)
      out_msg[byte_index + 1] |= val >> (8 - bit_offset);
    bit_pos += 6;
  }
}

uint32_t colorFrom2Bits(uint8_t val) {
  switch (val) {
    case 0: return matrix.Color(0, 0, 0);
    case 1: return matrix.Color(255, 0, 0);
    case 2: return matrix.Color(0, 255, 0);
    case 3: return matrix.Color(0, 0, 255);
    default: return matrix.Color(0, 0, 0);
  }
}

void setup() {
  matrix.begin();
  matrix.clear();
  matrix.show();

  encodePassword(password, message);
  reedSolomonEncode(message, encoded);
}

void loop() {
  matrix.clear(); showEncodedHalf(0); delay(5000);
  matrix.clear(); matrix.show(); delay(2000);
  matrix.clear(); showEncodedHalf(64); delay(5000);
  matrix.clear(); matrix.show(); delay(2000);
}

void showEncodedHalf(int startByte) {
  for (int byteIndex = 0; byteIndex < 64; ++byteIndex) {
    for (int bitPair = 0; bitPair < 4; ++bitPair) {
      int ledIndex = byteIndex * 4 + bitPair;
      if (ledIndex >= NUM_PIXELS) break;
      uint8_t twoBits = (encoded[startByte + byteIndex] >> (bitPair * 2)) & 0x03;
      uint32_t color = colorFrom2Bits(twoBits);
      int row = ledIndex / WIDTH;
      int col = ledIndex % WIDTH;
      int pixel = getPixelIndex(row, col);
      matrix.setPixelColor(pixel, color);
    }
  }
  matrix.show();
}

int getPixelIndex(int row, int col) {
  return (row % 2 == 0) ? (row * WIDTH + col) : (row * WIDTH + (WIDTH - 1 - col));
}