# Final Project - FPGA Implementation of HighLevel Synthesis in Post-Quantum Cryptography: Hardware Acceleration for Falcon Digital Signature

## Introduction
- Due to the advent of quantum computers, existing encryption systems face significant threats. To counteract quantum computers, post-quantum cryptography has emerged. Falcon is one of the algorithms in post-quantum cryptography. The main reasons for choosing the Falcon digital signature are its speed and scalability. In terms of speed, Falcon, using Fast Fourier Sampling, can perform thousands of signatures per second. Additionally, in terms of scalability, Falcon's security parameters can be adjusted according to user needs, with official versions including 256, 512, and 1024.
- Our research objective is to enhance Falcon's computational efficiency through hardware acceleration and simplify the development process using High-Level Synthesis (HLS). Furthermore, we implemented the entire Falcon process using a hardware-software co-design approach and integrated the designed hardware accelerators and FSIC into the SOC RTL source. With the complete SOC RTL source, we can observe the waveform of system-level simulations, and FSIC aids us in post-silicon validation.

## Folder Explanation

- `hls_src`: Catapult HLS source code
- `simulation`: FSIC-FPGA simulation files
- `validation`: On-Board(PYNQ) validation files
