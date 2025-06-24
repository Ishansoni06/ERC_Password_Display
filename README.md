# ERC 2025 – Challenge 2: Secure Data Transmission
## Subtask 2: Password Display Using LED Matrix
**Team:** CRISS Robotics  
**University:** BITS PILANI , PILANI CAMPUS   
**Subtask ID:** Challenge 2 – Subtask 2

## Problem Statement

The goal of this subtask is to display a 100-character password on a pair of RGB LED matrices and to ensure that the password is:
- Efficiently encoded for display
- Made robust against transmission and reading errors
- Recoverable using computer vision from a camera image of the LED matrix

Teams must implement:
- An encoding strategy for the password
- A decoder system using a camera and image processing (e.g., OpenCV)

## Ideas Discussed

1. Encoding Strategy: Convert the 100-character password into binary using a fixed-length format.
2. Color Mapping: Use each LED to represent 2 bits using 4 states:
   - 00 → Off  
   - 01 → Red  
   - 10 → Green  
   - 11 → Blue  
3. Reed–Solomon Error Correction:
   - Apply Reed–Solomon (RS) codes to protect against noise.
   - Enable recovery from up to 26 bytes of errors.
4. Display Layout:
   - Use two 16X16 RGB LED matrices.
   - 2 bits per LED → 512 LEDs → 1024 bits = 128 bytes.
5. Computer Vision Decoder:
   - Use OpenCV to decode the matrix from an image and extract the original password.

## Implemented Solution

### 1. Encoding Module (encoder_decoder/)

- Language: C 
- Functionality:  
   - Converts each password character into 6-bit binary.
   - 100 characters → 600 bits (75 bytes).
   - Uses Reed–Solomon to expand to 128 bytes (1024 bits).
   - Output is a 1024-bit binary stream ready for display.

### 2. LED Display Module (led_display/)

- Matrix Used: 2x (16X16 RGB LED) matrices  
- Color Encoding Scheme:

  | Color | Bits |
  |-------|------|
  | Off   | 00   |
  | Red   | 01   |
  | Green | 10   |
  | Blue  | 11   |

- Display Logic:
   - The 1024-bit encoded stream is chunked into 2-bit values.
   - These are mapped to LED states.
   - Images of 44 patterns generated for full bitstream visualization.
     
- Testing:
   - Tested different passwords on 8x8 RGB matrix 

### 3. Decoding Module (decoder_opencv/)

- Language: Python + OpenCV  
- Goal: Recover the original password from LED matrix images  
- Steps:
   - Detect individual LED colors in the matrix image
   - Map detected colors back to binary (2-bit values)
   - Reconstruct the 1024-bit stream
   - Apply Reed–Solomon decoding to extract the original 100-character password

### 4. Microcontroller Logic (microcontroller/)

- Device: ESP32 (planned)
- Status: Draft code prepared  
- Responsibilities:
   - Control LED patterns sequentially or statically
   - Accept 128-byte encoded stream and display it using RGB patterns

## Issues Encountered

- Hardware Limitations: Only one 8x8 matrix was available. Full 1024-bit display required splitting into multiple frames.
- Decoder Stability: Color identification accuracy varied under lighting conditions.
- Unverified Firmware: ESP32 code is not yet tested.

## Conclusion

- Successfully built a modular system that:
   - Encodes a password with RS for error resilience  
   - Visualizes binary data with a 4-color LED matrix display  
   - Recovers the password via OpenCV and RS decoding  
- The system can correct up to 26 bytes of visual errors.
- Future improvements include real-time decoding, calibration tools, and live ESP32 deployment.

## Repository Structure

ERC_Password_Display/
├── encoder_decoder/        
│   ├── rs_encode.py  
│   ├── rs_decode.py  
│   └── test_vectors/  
├── led_display/            
│   ├── pattern_generator.py  
│   └── led_patterns/  
├── decoder_opencv/         
│   ├── main_decoder.py  
│   ├── utils.py  
│   └── test_images/  
├── microcontroller/        
│   └── LED_matrix_display.ino  
└── README.md

