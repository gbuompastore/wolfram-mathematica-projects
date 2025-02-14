# Bitcoin Address Generation in Wolfram Mathematica

## Project Overview
This project provides an implementation of Bitcoin address generation using the Wolfram Language (Mathematica). It demonstrates the fundamental steps involved in creating a valid Bitcoin address from a private key, leveraging elliptic curve cryptography and Base58Check encoding. It follows the step-by-step process described in [this article](https://medium.com/coinmonks/how-to-generate-a-bitcoin-address-step-by-step-9d7fcbf1ad0b).

## Key Steps
### 1. Private Key Generation
A private key is a randomly generated 256-bit integer in the range:
```
1 <= sk <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364140
```
### 2. Public Key Generation
Using the Elliptic Curve secp256k1, the public key is obtained as:
```
pk = sk * G
```
Where `G` is the generator point defined by the secp256k1 curve.

### 3. Compressed Public Key
The compressed form of the public key is created using only the x-coordinate and a prefix based on the y-coordinate:
- `02` if y is even
- `03` if y is odd

### 4. Hashing and Address Encoding
- **Hashing**: Apply SHA-256 followed by RIPEMD-160 to the public key.
- **Prefix**: Add prefix based on the address type (e.g., `00` for a standard address).
- **Checksum**: Append the first 4 bytes of the double SHA-256 hash.
- **Base58 Encoding**: Convert the result into a Base58 string for the final address.

## Dependencies
- Wolfram Mathematica

## Running the Code
Open the `.nb` file in Wolfram Mathematica and run the provided cells to generate a Bitcoin address.

## References
- [How to Generate a Bitcoin Address (Coinmonks)](https://medium.com/coinmonks/how-to-generate-a-bitcoin-address-step-by-step-9d7fcbf1ad0b)
- [Private Key - Bitcoin Wiki](https://en.bitcoin.it/wiki/Private_key)

## License
This project is licensed under the MIT License.

