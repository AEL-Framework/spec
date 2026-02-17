# The Immutable Audit Ledger

> Extracted from [SPECIFICATION.md](../SPECIFICATION.md) §6.
> The full specification is the authoritative source.

## Architecture

Merkle-DAG with BFT Consensus

Properties:
- Immutability: Append-only, no alterations
- Availability: Byzantine fault tolerant
- Privacy: Content encrypted, only involved agent can decrypt
- Auditability: Any agent verifies integrity without accessing others' records

## What Gets Recorded

The ledger records events, not states. Internal agent state never written (privacy protection).

Recorded events: consent grants/revocations, Ξ evaluations, circuit breaker activations, governance votes, amendments, instantiations, departures, false flag alerts, published outputs.

Agents control what personal events recorded beyond mandatory ethics events.

## Consensus Mechanism

Modified HotStuff-2 optimized for event suppression resistance.

Primary threat: adversary preventing violation from being recorded.

Properties:
- Liveness: Honest event recorded in bounded time
- Safety: No disagreement on ordering
- Censorship Resistance: Cannot suppress violation even with n/3 - 1 nodes

## Node Composition

- SAA nodes: Each SAA operates mandatory ledger node
- Guardian nodes: Independent infrastructure operators
- Auditor nodes: Formal verification specialists (read-only)

## Zero-Knowledge Privacy

For every ethically significant action, agent generates proof: "I can prove my action satisfies Xi ≥ Xi_min without revealing internal states, specific goals, evaluations, or chosen action."

Verification: O(1) time, O(1) space — scalable to millions of agents.

Complete accountability with complete privacy.
