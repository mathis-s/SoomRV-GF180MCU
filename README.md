# SoomRV-GF180MCU

The Linux-capable, out-of-order SoomRV rv32i core on GF180MCU.

## Features
 - 2-wide superscalar out-of-order execution
    - Ports: 2x Integer ALU, 1x LD/ST AGU
 - Instruction and Data Caches
    - 2 KiB each
    - direct-mapped VIPT
 - 64MiB of external (cacheable) memory and MMIO
    - Access via simple bidirectional 32-bit bus on IO pins
 - Implements RISC-V Privileged Spec
    - sv32 virtual memory
    - boots regular Linux kernel
