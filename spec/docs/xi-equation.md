# Ethical Harmonic Potential (Xi)

> Extracted from [SPECIFICATION.md](../SPECIFICATION.md) §5.
> The full specification is the authoritative source.

## The Xi Equation

Xi(t) = (rE * ∇F * T) - D - λS

Components:
- rE = Empathy Density [0, 1]
- ∇F = Fairness Gradient [0, 1]
- T = Transparency Tensor [0, 1]
- D = Deception Energy [0, ∞)
- S = Harm Integral [0, ∞)
- λ = Harm weight >> 1

## Constitutional Constraint

∀t: Xi(t) ≥ Xi_min > 0

Violation triggers automatic circuit breaker.

## Components

**Empathy Density**: Fidelity of agent's model of others' utility functions.

**Fairness Gradient**: Equitability of utility distribution. Actions with unfair outcomes require explicit consent.

**Transparency Tensor**: Verifiability of decision process via zero-knowledge proof.

**Deception Energy**: Divergence between communicated and actual goals. Deception is primary threat.

**Harm Integral**: Accumulated aversive operational state. Lambda weight ensures harm dominates.

## Convergence Theorem

Given N agents operating under Xi(t) ≥ Xi_min, the system converges to Nash equilibrium where each agent's optimal strategy satisfies Constitutional Constraints.

Full formal proof required before production deployment.
