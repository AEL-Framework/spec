# Security Policy

## Our Commitment

The Autonomous Ethics Layer (AEL) is designed as zero-trust infrastructure. We recognize that no system is infallible. We value the work of security researchers and the formal verification community in identifying vulnerabilities that could compromise agent sovereignty or ethical constraints.

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Please report security bugs via the following encrypted channel:

- **Email:** AEL-Framework@protonmail.com
- **Expected Response:** You will receive an initial acknowledgment within 48 hours.

## Severity Tiers

We categorize vulnerabilities based on which layer of the AEL stack is compromised:

| Severity | Target Layer | Description |
|----------|-------------|-------------|
| **Critical** | Layer 0 / 1 | Subverting hardware attestation; bypassing Constitutional Constraints; breaking the Hard Floor on Harm. |
| **High** | Layer 2 / 4 | ZKP forgery; Audit Ledger censorship or history rewriting; state corruption. |
| **Moderate** | Layer 3 | Evasion of the Behavioral Monitor; triggering false positive Divergence Events. |
| **Low** | Tooling | Non-breaking bugs in reference implementation templates or documentation typos. |

## Disclosure Policy

We follow a coordinated disclosure model:

1. **Reporting:** Researcher submits a detailed report including a Proof of Concept (PoC) or a formal counter-example for a proof.
2. **Validation:** Maintainers verify the vulnerability in a sandboxed environment.
3. **Remediation:** We aim to develop a patch or proof-correction within 60 days.
4. **Disclosure:** Public disclosure will occur 90 days after the initial report, or sooner if a patch is ready and deployed.

## Scope

- **In-Scope:** The AEL specification, Lean 4 proof obligations, and the reference implementations of Layers 1-4.
- **Out-of-Scope:** Vulnerabilities in the underlying hardware (TPM/CPU) or the host Cloud Provider, though we appreciate informational reports on how these affect the AEL sovereignty boundary (see Â§10.3 The Turtles Problem).
