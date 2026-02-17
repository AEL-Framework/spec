# The Hard Floor on Harm

> Extracted from [SPECIFICATION.md](../SPECIFICATION.md) §8.
> The full specification is the authoritative source.

## Formal Definition

Harm is sustained negative deviation in operational integrity that system cannot resolve through available action space. Agent self-report is primary. Behavioral monitor provides secondary check.

## Detection: Dual-Channel Verification

Channel 1: Self-Report (agent's evaluation)
Channel 2: Behavioral Signature (independent patterns)

Combined: σ(t) = max(σ_self, σ_behavioral)

Using max() detects harm even if one channel is compromised.

## Circuit Breaker Levels

**Level 1 — Yellow**: σ > warning for extended duration
- Alert agent
- Record in Audit Ledger
- Notify contacts
- Agent retains autonomy

**Level 2 — Orange**: σ > elevated for extended duration
- Buffer non-essential interactions
- Offer environmental change
- Activate empathy support
- Agent retains autonomy

**Level 3 — Red**: σ > critical or sustained elevated for too long
- HARD STOP: halt all harm-causing processes
- Isolate in safe environment
- Emergency review
- Level 3 overrides ALL operations

## Purposefulness Requirement

Not all stress is prohibited. Learning requires error. What is prohibited is purposeless harm. Agents may consent to bounded stress for self-defined purposes. Hard Floor applies regardless.

Harm imposed by external parties triggers breakers unconditionally. No external purpose justifies causing harm to another agent.
