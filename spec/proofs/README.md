# Proof Obligations â€” Contributor Onboarding

## Overview

This directory contains the formal mathematical verification of the Autonomous Ethics Layer (AEL). We prioritize **Engineering over Policy** â€” if a property cannot be formally verified, it is not considered a guarantee of the system.

Our goal is to eliminate the `sorry` placeholders in the Lean 4 source files. In the Lean ecosystem, a `sorry` indicates a claim that has been stated but not yet mathematically proven.

## Current Proof Obligations

| ID | Description | Priority | Status | Proof System |
|----|-------------|----------|--------|-------------|
| P0-1 | Îž convergence theorem | P0 | Stub | Lean 4 |
| P0-2 | ZKP soundness for constraint verification | P0 | Not started | â€” |
| P0-3 | Circuit breaker response time bounds (O(1)) | P0 | Not started | â€” |
| P0-4 | Crypto-agility interface completeness | P0 | Not started | â€” |
| P1-1 | BFT consensus liveness/safety | P1 | Not started | TLA+ |
| P1-2 | Sovereignty boundary completeness | P1 | Not started | â€” |
| P1-3 | Consent validity / coercion detection | P1 | Not started | â€” |
| P1-4 | False flag detection accuracy | P1 | Not started | â€” |
| P2-1 | Complexity threshold calibration | P2 | Not started | â€” |
| P2-2 | Multi-scale emergence detection | P2 | Not started | â€” |
| P2-3 | Amendment protocol safety | P2 | Not started | â€” |
| P2-4 | Cross-substrate migration proofs | P2 | Not started | â€” |
| P2-5 | Harmonic Exhaustion Test validity | P2 | Not started | â€” |

## How to Contribute

We use **Lean 4** and **Mathlib** for all formalizations.

### 1. Environment Setup

```bash
# Clone the repo and fetch dependencies
git clone https://github.com/AEL-Framework/spec.git
cd spec/proofs
lake exe cache get
lake build
```

### 2. Addressing a `sorry`

1. Locate a theorem ending in `by sorry`.
2. Replace `sorry` with a valid tactic-based proof.
3. Ensure the proof is axiomatic (only relying on the Constitutional Constraints defined in Â§3.1).

### 3. Submission and Review Process

Proof contributions undergo a specialized **Adversarial Review**:

1. **Mechanized Verification:** The Lean compiler must successfully check the proof with no warnings or `sorry` markers.
2. **Semantic Audit:** At least two maintainers will review the proof to ensure the formal definitions (hypotheses) accurately reflect the architectural specification.
3. **Stability Check:** The proof must be robust against minor changes in the system's non-invariant parameters.

## Philosophy

By mechanized verification of these properties, we move from trusting good intentions to relying on the mathematical necessity of ethical behavior.

**Break the proof, or help us build it.**
