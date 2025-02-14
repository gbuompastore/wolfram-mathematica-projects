# Speck Cipher Implementation in Wolfram Mathematica

## Project Overview
This project provides an implementation of the Speck block cipher family in Wolfram Language (Mathematica). Speck is a lightweight block cipher designed by the U.S. National Security Agency (NSA), suitable for constrained environments like IoT devices.

## Supported Versions
The implementation covers different versions of Speck, including:
- Speck32/64 (32-bit block size, 64-bit key)
- Other versions based on the Speck cipher family

## Key Features
- Key expansion function for round key generation.
- Encryption and decryption functions.
- Support for different block and key sizes (e.g., Speck32/64).

## Files
- `speck32_64.nb`: Implementation specific to the Speck32/64 version.
- `speck all version.nb`: Generalized implementation supporting multiple versions of Speck.

## Dependencies
- Wolfram Mathematica

## Running the Code
Open the desired `.nb` file in Wolfram Mathematica and evaluate the cells to encrypt or decrypt data using the Speck cipher.

## References
- [Speck and Simon Ciphers - NSA](https://eprint.iacr.org/2013/404.pdf)
- [Wikipedia - Speck (cipher)](https://en.wikipedia.org/wiki/Speck_(cipher))

## License
This project is licensed under the MIT License.
