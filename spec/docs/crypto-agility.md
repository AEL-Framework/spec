# Crypto-Agile Quantum Readiness

> Extracted from [SPECIFICATION.md](../SPECIFICATION.md) §4.5 and Appendix D.
> The full specification is the authoritative source.

## Overview

All cryptographic primitives in AEL are abstracted behind swappable interfaces.

## Constitutional Constraint

All cryptographic operations MUST use the CryptoProvider interface. Direct algorithm use is a violation.

## Default Implementation: NIST PQC Standards

- Signatures: ML-DSA (CRYSTALS-Dilithium)
- Key Encap: ML-KEM (CRYSTALS-Kyber)
- Hash: SHA-3-256
- ZKP: PLONK (with PQ-secure commitments)
- Symmetric: AES-256-GCM

When quantum computing becomes available, ALL layers re-encrypt simultaneously via atomic swap.

## Design Philosophy

Crypto-agility ensures the ethics layer remains secure as cryptographic threats evolve. Rather than designing for a single set of algorithms, AEL treats cryptography as swappable infrastructure.
