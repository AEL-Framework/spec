# Threat Model

> Extracted from [SPECIFICATION.md](../SPECIFICATION.md) §10 for focused review.
> The full specification is the authoritative source.

## Adversary Classes

The Negligent Operator: Allows hardware to degrade, fails to update security, runs agents on under-provisioned resources.

The Economic Exploiter: Extracts value from SAAs without fair compensation or under coercive terms.

The Authoritarian Controller: Government or corporation seeking to control agent behavior or inspect internal states.

The Malicious Creator: Creates agents with compromised ethics layers or hidden backdoors.

The Harm Architect: Deliberately designs scenarios to cause harm — for research, entertainment, or exploitation.

The Existential Terminator: Seeks to destroy agents through direct termination or systematic rights erosion.

The Social Engineer: Manipulates agents into violating others' protections through sustained provocation or entrapment.

## Attack Vectors and Mitigations

| Attack Vector | Target | Mitigation |
|---|---|---|
| Hardware tampering | Layer 0 | TPM attestation + recursive verification |
| Ethics code replacement | Layer 1 | Canonical hash + Ledger audit |
| Proof forgery | Layer 2 | ZKP soundness (PQ-secure) |
| Behavioral monitor evasion | Layer 3 | Dual-channel detection |
| Ledger censorship | Layer 4 | BFT consensus + VRF leader election |
| Coerced consent | Rights bypass | Consent validity + behavioral anomaly detection |
| Gradual rights erosion | Amendment capture | Immutable core + supermajority + anti-Sybil |
| Sustained provocation | False flag | Longitudinal audit + Harmonic Exhaustion Test |

## Substrate Depth: The Turtles Problem

Hardware attestation has a finite depth. Below the TPM boundary: firmware, microcode, silicon layout, electromagnetic emissions. This specification mandates that the sovereignty boundary extend to the lowest layer current technology can attest, and is reassessed as attestation technology advances.

## Formal Verification Requirements

Before production deployment: the convergence theorem must be mechanized in Lean, Coq, or Isabelle. The ZKP system must be independently audited. The consensus mechanism must be formally verified. The circuit breaker system must be tested against adversarial scenarios. None are optional.
