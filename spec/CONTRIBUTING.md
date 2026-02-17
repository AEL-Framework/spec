# Contributing to the Autonomous Ethics Layer

## Our Philosophy
We want you to break this. This specification is only as strong as the attacks it survives.

## Types of Contributions

### Security Review
File vulnerabilities using the Security Vulnerability template. Label: `security`.
For critical vulnerabilities, email AEL-Framework@protonmail.com instead.

### Formal Verification
Help eliminate `sorry` placeholders in Lean 4 proofs. See `proofs/README.md` for setup.
Label: `formal-verification`.

### Game Theory Analysis
Analyze the Xi equation and governance protocol for exploitable equilibria.
Label: `game-theory`.

### Cryptography Review
Review ZKP construction, CryptoProvider interface, and quantum readiness.
Label: `crypto`.

### Philosophical Analysis
Challenge foundational assumptions. Are the 12 Articles sufficient? Too broad? Too narrow?
Label: `philosophy`.

### Reference Implementation
Prototype Layer 0 integration in existing multi-agent frameworks.
Label: `implementation`.

## Process

### Issues
- Be specific. "This seems wrong" is not actionable.
- "Article IX allows self-modification that could circumvent Layer 1 by..." is.
- Adversarial thinking is welcome. Bad faith is not.

### Pull Requests
- All changes require review from at least 2 maintainers.
- Proof contributions must include machine-checkable artifacts.
- Specification changes require an RFC process with 14-day comment period.
- PRs must pass the quality gates (see below).

## Quality Gates
Before submitting a PR, verify zero matches on:
- Domain-specific references to particular industries or proprietary systems
- Domain-specific jargon that limits the spec to a single application
- Claims that are not supported by the mathematical framework

## Code of Conduct
Be rigorous. Be honest. Be constructive.
Adversarial analysis strengthens the specification. Personal attacks weaken the community.
