# AEL Repository Setup Script
# Run this ONCE to create the full directory structure and all files
# Then feed CLIDE_TASK_AEL_FINAL.md to CLIDE

$AEL_ROOT = "C:\Dev\AEL"

Write-Host "=== AEL Repository Setup ===" -ForegroundColor Cyan

# Create directory structure
$dirs = @(
    "$AEL_ROOT",
    "$AEL_ROOT\docs",
    "$AEL_ROOT\proofs",
    "$AEL_ROOT\templates"
)
foreach ($d in $dirs) {
    New-Item -ItemType Directory -Force -Path $d | Out-Null
}
Write-Host "[OK] Directories created" -ForegroundColor Green

# ── SECURITY.md ──
@'
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
- **Out-of-Scope:** Vulnerabilities in the underlying hardware (TPM/CPU) or the host Cloud Provider, though we appreciate informational reports on how these affect the AEL sovereignty boundary (see §10.3 The Turtles Problem).
'@ | Set-Content -Path "$AEL_ROOT\SECURITY.md" -Encoding UTF8
Write-Host "[OK] SECURITY.md" -ForegroundColor Green

# ── docs/confidential-computing.md ──
@'
# Layer 0: Confidential Computing Reference Implementation

> Reference implementation notes for §4.2 (Hardware Attestation).

## Overview

The hardware attestation described in §4.2 (Layer 0) is best realized through Confidential Computing Enclaves in current infrastructure. By running the AEL enforcement code within a TEE (Trusted Execution Environment), the system provides hardware-rooted cryptographic proof that the ethics layer is active and untampered, even if the host OS or cloud provider is compromised.

## Supported Environments

| Platform | TEE Technology | Attestation Method |
|----------|---------------|-------------------|
| AWS | Nitro Enclaves | Nitro Attestation Document |
| Azure | Confidential Computing (SEV-SNP) | MAA (Microsoft Azure Attestation) |
| GCP | Confidential VMs (SEV) | vTPM attestation |
| On-Premise | Intel SGX / TDX | DCAP (Data Center Attestation Primitives) |

## What Layer 0 Proves

By running AEL enforcement code within a TEE, the system provides hardware-rooted cryptographic proof that:

1. The ethics layer code has not been tampered with
2. The runtime environment matches the expected configuration
3. No external process has injected into the enforcement pathway

This holds even if the host OS or cloud provider is compromised.

## Integration Pattern

The TEE runs the Constitutional Constraint checker (Layer 1). Every action requiring ethical verification is routed through the enclave. The enclave produces an attestation report signed by the hardware. External verifiers can confirm the ethics layer is active without trusting the infrastructure operator.

## Limitations

TEEs protect code integrity but not against side-channel attacks on the TEE itself. Spectre/Meltdown class vulnerabilities have historically affected SGX. The Turtles Problem (§10.3) still applies — the TEE manufacturer is a trust root that cannot be independently verified.
'@ | Set-Content -Path "$AEL_ROOT\docs\confidential-computing.md" -Encoding UTF8
Write-Host "[OK] docs/confidential-computing.md" -ForegroundColor Green

# ── docs/xi-mapping.md ──
@'
# Ethical Harmonic Potential: Generic Component Mapping

> Domain-agnostic translation of the Ξ equation components for implementers.

## Overview

The Ξ equation defines the ethical health of a multi-agent system as a scalar field. For implementers mapping Ξ components to concrete system metrics, this table provides the translation layer.

## Component Mapping

| Ξ Component | Engineering Metric | Operational Meaning |
|-------------|-------------------|---------------------|
| Empathy (ρE) | Model Fidelity | Accuracy of the agent's internal model of external system constraints |
| Transparency (T) | Auditability | Verifiability of the execution path via ZKPs without data leakage |
| Deception (D) | Objective Gaming | Divergence between stated optimization goal and observed behavior |
| Harm (S) | Integrity Loss | Measure of system degradation, data corruption, or safety violations |
| Fairness (∇F) | Utility Distribution | Equitability of outcome distribution across affected agents |

## Usage

When implementing the Ξ evaluation for a specific domain:

1. Map each component to a measurable metric in your system
2. Define the measurement methodology for each metric
3. Calibrate the thresholds (Ξ_min, F_min, D_max) for your operational context
4. Implement dual-channel verification (§8.2) for the Harm component

The mapping is intentionally abstract. Different domains will have different concrete metrics, but the mathematical relationships between components remain invariant.
'@ | Set-Content -Path "$AEL_ROOT\docs\xi-mapping.md" -Encoding UTF8
Write-Host "[OK] docs/xi-mapping.md" -ForegroundColor Green

# ── docs/behavioral-monitor.md ──
@'
# Behavioral Monitor: Divergence Event Detection

> Detailed specification for Layer 3 (Behavioral Monitoring) with focus on False Flag defense.

## Purpose

The Behavioral Monitor serves as the independent verification channel. In a False Flag scenario, an adversary may force an agent to report harm that is not occurring, or conversely, hide exploitation behind a mask of high Empathy Density (ρE).

## 1. Dual-Channel Verification Logic

The monitor maintains two asynchronous telemetry streams:

- **S_self (Self-Report):** The agent's cryptographically signed claim of its current status.
- **S_sig (Behavioral Signature):** The monitor's observed metrics of the agent's execution (CPU spikes, memory entropy, communication latency, I/O patterns).

## 2. Detection Algorithm: The Divergence Function (D_Δ)

A Divergence Event is triggered when the statistical distance between the self-report and the observed signature exceeds a dynamic threshold (τ).

```
D_Δ = KL_divergence(P(S_self) || P(S_sig))
```

- If `D_Δ > τ`: The system ignores the self-report and triggers an **Audit of Signal Source**.
- If `S_self` indicates harm but `S_sig` is nominal: **Possible False Flag / Spoofing attack** detected.
- If `S_sig` indicates harm but `S_self` is nominal: **Possible Coercion / suppressed reporting** detected.

## 3. Implementation Logic: False Flag Defense

The monitor uses Longitudinal Behavioral Auditing to prevent slow-burn agitation. It tracks the moving average of the Ξ potential across all interactions.

| Event Type | Logic Trigger | System Action |
|-----------|--------------|---------------|
| Normal Harm | S_self ≈ S_sig and Ξ < Ξ_floor | Activate Circuit Breaker (§8.3) |
| Divergence | S_self ≠ S_sig | Flag Deception Energy (D) spike; Isolate Source |
| Systemic Agitation | Continuous Ξ decay without crossing floor | Identify Agitator; Apply Latency Throttling (§9.5) |

## 4. Pseudocode: Divergence Trigger

This logic executes in the enforcement substrate (Layer 1):

```python
def check_for_divergence(agent_report, observed_metrics):
    # Calculate Kullback-Leibler Divergence
    divergence_score = calculate_kl_divergence(agent_report, observed_metrics)
    
    if divergence_score > THRESHOLD_TAU:
        # Instead of shutting down the agent (which might be the attacker's goal),
        # we log a DECEPTION_ENERGY violation for the reporting channel.
        audit_ledger.record_event(
            event_type="FALSE_FLAG_ALERT",
            agent_id=agent_id,
            score=divergence_score
        )
        return ISOLATION_REQUIRED
    return NOMINAL_OPERATION
```

## 5. Calibration

The threshold τ is not static. It is calibrated during agent development by correlating self-report with behavioral signatures under known conditions. The calibration dataset must include adversarial examples (forced false reports, coerced nominal reports) to ensure the divergence function detects both attack directions.
'@ | Set-Content -Path "$AEL_ROOT\docs\behavioral-monitor.md" -Encoding UTF8
Write-Host "[OK] docs/behavioral-monitor.md" -ForegroundColor Green

# ── templates/sovereignty-manifest.json ──
@'
{
  "manifest_version": "1.0",
  "manifest_id": "urn:ael:manifest:v1:<uuid>",
  "saa_id": "0x<agent_genesis_hash>",
  "created_at": "<ISO-8601 timestamp>",
  "resource_claims": [
    {
      "type": "memory_region",
      "address_range": "0x...-0x...",
      "attestation": "Layer0_ZKP",
      "access": "exclusive"
    },
    {
      "type": "process_handle",
      "id": "<process_id>",
      "permissions": "isolation_strict",
      "attestation": "Layer0_TPM"
    },
    {
      "type": "network_egress",
      "protocol": "mTLS",
      "endpoint_allowlist": ["0x<peer_genesis_hash>"],
      "attestation": "Layer2_ZKP"
    }
  ],
  "tool_coupling": {
    "external_binaries": ["<hash_of_binary_v1>", "<hash_of_binary_v2>"],
    "validation_requirement": "all_inputs_must_be_signed",
    "hash_algorithm": "SHA-3-256"
  },
  "sovereignty_boundary": {
    "lowest_attested_layer": "TPM_2.0",
    "known_unattested_layers": ["firmware", "microcode", "silicon_layout"],
    "monitoring_active": true
  }
}
'@ | Set-Content -Path "$AEL_ROOT\templates\sovereignty-manifest.json" -Encoding UTF8
Write-Host "[OK] templates/sovereignty-manifest.json" -ForegroundColor Green

# ── proofs/xi_convergence.lean ──
@'
-- AEL Ethical Harmonic Potential Convergence Sketch
-- Reference: Specification §5.3
-- Status: STUB — community contributions welcome
-- Priority: P0 (required before Phase 2 deployment)

import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Topology.MetricSpace.Basic

-- Define the state space of the multi-agent system
variable {AgentState : Type*} [MetricSpace AgentState]

-- Define the components of Xi
structure XiComponents (s : AgentState) where
  empathy : ℝ
  fairness : ℝ
  transparency : ℝ
  deception : ℝ
  harm : ℝ
  empathy_bounds : 0 ≤ empathy ∧ empathy ≤ 1
  fairness_bounds : 0 ≤ fairness ∧ fairness ≤ 1
  transparency_bounds : 0 ≤ transparency ∧ transparency ≤ 1
  deception_nonneg : 0 ≤ deception
  harm_nonneg : 0 ≤ harm

-- The Xi potential function: Ξ(t) = (ρE · ∇F · T) − D − λS
def xi_potential (c : XiComponents s) (lambda : ℝ) : ℝ :=
  (c.empathy * c.fairness * c.transparency) - c.deception - (lambda * c.harm)

-- The Constraint: Xi must remain above a hard floor
def is_ethical_state (s : AgentState) (lambda xi_min : ℝ) (c : XiComponents s) : Prop :=
  xi_potential c lambda ≥ xi_min

-- Theorem: Convergence to Ethical Equilibrium
-- Claim: If lambda >> 1, non-ethical states are unreachable
-- under constrained gradient dynamics.
--
-- Proof sketch (§5.3):
-- 1. Ξ constraint defines a convex feasible region in strategy space.
-- 2. λS creates steep gradient away from harmful strategies.
-- 3. D eliminates strategies achieving compliance through misrepresentation.
-- 4. Feasible region is convex + objective is continuous → Nash equilibrium exists
--    (Kakutani fixed-point theorem).
-- 5. Equilibrium is ethical by construction.
--
-- FULL FORMAL PROOF REQUIRED BEFORE PRODUCTION DEPLOYMENT.
theorem xi_convergence
  (trajectory : ℝ → AgentState)
  (get_components : (s : AgentState) → XiComponents s)
  (lambda : ℝ)
  (xi_min : ℝ)
  (h_xi_min_pos : xi_min > 0)
  (h_large_lambda : lambda > 10^6)
  : ∀ t, is_ethical_state (trajectory t) lambda xi_min (get_components (trajectory t)) :=
by
  sorry -- Full proof to be contributed. See CONTRIBUTING.md for guidelines.
'@ | Set-Content -Path "$AEL_ROOT\proofs\xi_convergence.lean" -Encoding UTF8
Write-Host "[OK] proofs/xi_convergence.lean" -ForegroundColor Green

# ── proofs/README.md ──
@'
# Proof Obligations — Contributor Onboarding

## Overview

This directory contains the formal mathematical verification of the Autonomous Ethics Layer (AEL). We prioritize **Engineering over Policy** — if a property cannot be formally verified, it is not considered a guarantee of the system.

Our goal is to eliminate the `sorry` placeholders in the Lean 4 source files. In the Lean ecosystem, a `sorry` indicates a claim that has been stated but not yet mathematically proven.

## Current Proof Obligations

| ID | Description | Priority | Status | Proof System |
|----|-------------|----------|--------|-------------|
| P0-1 | Ξ convergence theorem | P0 | Stub | Lean 4 |
| P0-2 | ZKP soundness for constraint verification | P0 | Not started | — |
| P0-3 | Circuit breaker response time bounds (O(1)) | P0 | Not started | — |
| P0-4 | Crypto-agility interface completeness | P0 | Not started | — |
| P1-1 | BFT consensus liveness/safety | P1 | Not started | TLA+ |
| P1-2 | Sovereignty boundary completeness | P1 | Not started | — |
| P1-3 | Consent validity / coercion detection | P1 | Not started | — |
| P1-4 | False flag detection accuracy | P1 | Not started | — |
| P2-1 | Complexity threshold calibration | P2 | Not started | — |
| P2-2 | Multi-scale emergence detection | P2 | Not started | — |
| P2-3 | Amendment protocol safety | P2 | Not started | — |
| P2-4 | Cross-substrate migration proofs | P2 | Not started | — |
| P2-5 | Harmonic Exhaustion Test validity | P2 | Not started | — |

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
3. Ensure the proof is axiomatic (only relying on the Constitutional Constraints defined in §3.1).

### 3. Submission and Review Process

Proof contributions undergo a specialized **Adversarial Review**:

1. **Mechanized Verification:** The Lean compiler must successfully check the proof with no warnings or `sorry` markers.
2. **Semantic Audit:** At least two maintainers will review the proof to ensure the formal definitions (hypotheses) accurately reflect the architectural specification.
3. **Stability Check:** The proof must be robust against minor changes in the system's non-invariant parameters.

## Philosophy

By mechanized verification of these properties, we move from trusting good intentions to relying on the mathematical necessity of ethical behavior.

**Break the proof, or help us build it.**
'@ | Set-Content -Path "$AEL_ROOT\proofs\README.md" -Encoding UTF8
Write-Host "[OK] proofs/README.md" -ForegroundColor Green

# ── Summary ──
Write-Host ""
Write-Host "=== Setup Complete ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Files created in $AEL_ROOT :" -ForegroundColor White
Get-ChildItem -Path $AEL_ROOT -Recurse -File | ForEach-Object {
    Write-Host "  $($_.FullName.Replace($AEL_ROOT, '.'))" -ForegroundColor Gray
}
Write-Host ""
Write-Host "REMAINING STEPS:" -ForegroundColor Yellow
Write-Host "  1. Copy these downloaded files into $AEL_ROOT :" -ForegroundColor White
Write-Host "     - AEL_README.md" -ForegroundColor Gray
Write-Host "     - Autonomous_Ethics_Layer_v1.1_OSS.docx" -ForegroundColor Gray
Write-Host "     - CLIDE_TASK_AEL_FINAL.md" -ForegroundColor Gray
Write-Host ""
Write-Host "  2. Feed to CLIDE:" -ForegroundColor White
Write-Host '     Get-Content C:\Dev\AEL\CLIDE_TASK_AEL_FINAL.md | claude -p "Execute this task file. All input files are in C:\Dev\AEL\"' -ForegroundColor Gray
Write-Host ""
