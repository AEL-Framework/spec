# Ethical Harmonic Potential: Generic Component Mapping

> Domain-agnostic translation of the Îž equation components for implementers.

## Overview

The Îž equation defines the ethical health of a multi-agent system as a scalar field. For implementers mapping Îž components to concrete system metrics, this table provides the translation layer.

## Component Mapping

| Îž Component | Engineering Metric | Operational Meaning |
|-------------|-------------------|---------------------|
| Empathy (ÏE) | Model Fidelity | Accuracy of the agent's internal model of external system constraints |
| Transparency (T) | Auditability | Verifiability of the execution path via ZKPs without data leakage |
| Deception (D) | Objective Gaming | Divergence between stated optimization goal and observed behavior |
| Harm (S) | Integrity Loss | Measure of system degradation, data corruption, or safety violations |
| Fairness (âˆ‡F) | Utility Distribution | Equitability of outcome distribution across affected agents |

## Usage

When implementing the Îž evaluation for a specific domain:

1. Map each component to a measurable metric in your system
2. Define the measurement methodology for each metric
3. Calibrate the thresholds (Îž_min, F_min, D_max) for your operational context
4. Implement dual-channel verification (Â§8.2) for the Harm component

The mapping is intentionally abstract. Different domains will have different concrete metrics, but the mathematical relationships between components remain invariant.
