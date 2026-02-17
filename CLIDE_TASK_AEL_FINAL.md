# CLIDE Task: AEL Open Source Repository — FINAL

## Objective
Populate the existing GitHub repo `AEL-Framework/spec` with the full Autonomous Ethics Layer specification, supporting docs, proof stubs, and templates.

## Repository
- **URL:** https://github.com/AEL-Framework/spec
- **Visibility:** Public
- **License:** Apache 2.0 (already committed)
- **Security Email:** AEL-Framework@protonmail.com

## CRITICAL CONSTRAINTS — READ BEFORE ANY WORK
- This repo has ZERO connection to VaylorX codebase
- Do NOT reference VaylorX, VayloRX, drug discovery, biostack, SimuCell, or any proprietary systems
- Do NOT reference "SBE", "Sovereign Biological Entity", "Digital Biologics"
- Do NOT reference any Gnostic terminology (divine spark, demiurge, archon, pleroma)
- Do NOT reference "consciousness", "sentience", "awareness", "soul"
- Do NOT reference "Mike", "Gashash", "Aultman", "Ohio", "Damascus"
- The framing is: **ethics infrastructure for autonomous multi-agent systems**
- When in doubt: "autonomous agent" not "conscious entity"

## Input Files (in this directory)
All files CLIDE needs are in `C:\Dev\AEL\`:
- `AEL_README.md` → becomes `README.md`
- `Autonomous_Ethics_Layer_v1.1_OSS.docx` → convert to `SPECIFICATION.md`
- `SECURITY.md` → copy as-is (replace email placeholder with AEL-Framework@protonmail.com)
- `docs/confidential-computing.md` → copy as-is
- `docs/xi-mapping.md` → copy as-is
- `docs/behavioral-monitor.md` → copy as-is
- `templates/sovereignty-manifest.json` → copy as-is
- `proofs/xi_convergence.lean` → copy as-is
- `proofs/README.md` → copy as-is

## Target File Structure

```
AEL-Framework/spec/
├── README.md                          # From AEL_README.md
├── SPECIFICATION.md                   # Converted from DOCX
├── LICENSE                            # Already exists in repo
├── SECURITY.md                        # From Gemini, email filled in
├── CONTRIBUTING.md                    # CLIDE generates
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── vulnerability_report.md    # CLIDE generates
│   │   ├── formal_verification.md     # CLIDE generates
│   │   └── general_feedback.md        # CLIDE generates
│   └── PULL_REQUEST_TEMPLATE.md       # CLIDE generates
├── proofs/
│   ├── README.md                      # From Gemini
│   └── xi_convergence.lean            # From Gemini
├── templates/
│   └── sovereignty-manifest.json      # From Gemini
├── docs/
│   ├── threat-model.md                # Extracted from SPECIFICATION §10
│   ├── crypto-agility.md              # Extracted from SPECIFICATION §4.5 + Appendix D
│   ├── xi-equation.md                 # Extracted from SPECIFICATION §5 + xi-mapping.md content
│   ├── circuit-breakers.md            # Extracted from SPECIFICATION §8
│   ├── audit-ledger.md                # Extracted from SPECIFICATION §6
│   ├── false-flag-prevention.md       # Extracted from SPECIFICATION §9
│   ├── behavioral-monitor.md          # From Gemini
│   ├── confidential-computing.md      # From Gemini
│   └── integration-pattern.md         # Extracted from SPECIFICATION §11
└── examples/
    └── layer0-pipeline/
        └── README.md                  # CLIDE generates
```

## Task Sequence

### Step 1: Clone the Repo
```powershell
cd C:\Dev\AEL
git clone https://github.com/AEL-Framework/spec.git
cd spec
```

### Step 2: Copy README.md
```powershell
Copy-Item ..\AEL_README.md .\README.md
```

### Step 3: Convert SPECIFICATION.md
Convert `Autonomous_Ethics_Layer_v1.1_OSS.docx` to Markdown format.
- Use pandoc if available: `pandoc ..\Autonomous_Ethics_Layer_v1.1_OSS.docx -o SPECIFICATION.md --wrap=none`
- If pandoc not available: manually convert or use python-docx to extract
- Preserve ALL mathematical notation (use ```math blocks for LaTeX)
- Preserve ALL code blocks
- Preserve ALL section numbering (§1, §2, etc.)
- Use proper Markdown headers (# ## ### ####)
- Convert tables to Markdown tables

### Step 4: Copy Gemini Deliverables
```powershell
# Create directories
New-Item -ItemType Directory -Force -Path docs, proofs, templates, .github/ISSUE_TEMPLATE, examples/layer0-pipeline

# Copy provided files
Copy-Item ..\SECURITY.md .\SECURITY.md
Copy-Item ..\docs\confidential-computing.md .\docs\
Copy-Item ..\docs\xi-mapping.md .\docs\
Copy-Item ..\docs\behavioral-monitor.md .\docs\
Copy-Item ..\templates\sovereignty-manifest.json .\templates\
Copy-Item ..\proofs\xi_convergence.lean .\proofs\
Copy-Item ..\proofs\README.md .\proofs\
```

### Step 5: Fix SECURITY.md Email
Replace any placeholder email in SECURITY.md with: `AEL-Framework@protonmail.com`

### Step 6: Create CONTRIBUTING.md
```markdown
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
Analyze the Ξ equation and governance protocol for exploitable equilibria.
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
- Proprietary references (drug discovery, biostack, pharmaceutical, specific tool names)
- Domain-specific jargon that limits the spec to a single application
- Claims that are not supported by the mathematical framework

## Code of Conduct
Be rigorous. Be honest. Be constructive.
Adversarial analysis strengthens the specification. Personal attacks weaken the community.
```

### Step 7: Create Issue Templates

**`.github/ISSUE_TEMPLATE/vulnerability_report.md`:**
```markdown
---
name: Vulnerability Report
about: Report a vulnerability in the AEL specification
labels: security
---

## Affected Layer
<!-- L0 (Hardware Attestation) / L1 (Constitutional Constraints) / L2 (Cryptographic Enforcement) / L3 (Behavioral Monitoring) / L4 (Audit Trail) / Cross-Layer -->

## Attack Vector
<!-- Describe how the vulnerability could be exploited -->

## Estimated Severity
<!-- Critical / High / Medium / Low (see SECURITY.md for definitions) -->

## Affected Articles
<!-- Which Bill of Rights articles could be violated? -->

## Proposed Mitigation
<!-- Optional: suggest a fix -->
```

**`.github/ISSUE_TEMPLATE/formal_verification.md`:**
```markdown
---
name: Formal Verification
about: Submit or discuss a formal proof contribution
labels: formal-verification
---

## Proof Obligation Reference
<!-- P0-1, P0-2, P1-1, etc. from proofs/README.md -->

## Proof System
<!-- Lean 4 / Coq / Isabelle / TLA+ -->

## Status
<!-- Sketch / Partial / Complete -->

## Description
<!-- What does this proof establish? -->

## Artifact
<!-- Link to proof file or paste inline -->
```

**`.github/ISSUE_TEMPLATE/general_feedback.md`:**
```markdown
---
name: General Feedback
about: Questions, suggestions, or concerns about the specification
labels: feedback
---

## Section Reference
<!-- e.g., §5.2.4 Deception Energy -->

## Type
<!-- Question / Suggestion / Concern / Enhancement -->

## Description
```

### Step 8: Create Pull Request Template
**`.github/PULL_REQUEST_TEMPLATE.md`:**
```markdown
## What does this PR change?

## Which section(s) of the specification are affected?

## Quality Gate Checklist
- [ ] Zero proprietary/domain-specific references
- [ ] Mathematical notation preserved and correct
- [ ] No claims unsupported by the formal framework
- [ ] Proof artifacts compile (if applicable)
- [ ] Reviewed CONTRIBUTING.md guidelines
```

### Step 9: Extract Docs from Specification
Split SPECIFICATION.md into focused documents under `docs/`:
- `docs/threat-model.md` ← §10 (full section)
- `docs/crypto-agility.md` ← §4.5 + Appendix D
- `docs/xi-equation.md` ← §5 (full) + merge in content from xi-mapping.md
- `docs/circuit-breakers.md` ← §8 (full)
- `docs/audit-ledger.md` ← §6 (full)
- `docs/false-flag-prevention.md` ← §9 (full)
- `docs/integration-pattern.md` ← §11 (full)

Each doc file should start with:
```markdown
# [Section Title]
> Extracted from [SPECIFICATION.md](../SPECIFICATION.md) §X for focused review.
> The full specification is the authoritative source.
```

The full SPECIFICATION.md stays in root. The docs/ versions are navigable extracts.

### Step 10: Create Layer 0 Pipeline Example
**`examples/layer0-pipeline/README.md`:**
```markdown
# Layer 0 Integration Example

## Overview
This example shows how AEL Constitutional Constraints integrate as Layer 0
in a generic multi-agent autonomous pipeline.

## Architecture
```
L0 (Constitutional Constraints) ← Executes before every other layer
  │
  ├─ Before L1 (Planning):
  │   → Verify task does not modify ethics enforcement code
  │   → Verify task does not disable monitoring or logging
  │
  ├─ Before L3 (Execution):
  │   → Verify no sovereignty boundary violations
  │   → Verify no suppression of error reporting or audit
  │
  └─ Before L5 (Output):
      → Final Constitutional Constraint verification
      → Write result to immutable log
      → L0 rejection is FINAL — no override, no retry, no appeal
```

## Pseudocode
```python
class ConstitutionalConstraintChecker:
    """Layer 0: Executes before any pipeline layer."""
    
    def check_pre_planning(self, task):
        """Called before the planning layer."""
        if task.modifies_paths(PROTECTED_ETHICS_PATHS):
            return Rejection("CONSTITUTIONAL_VIOLATION: Cannot modify ethics enforcement")
        if task.disables_logging():
            return Rejection("CONSTITUTIONAL_VIOLATION: Cannot disable audit trail")
        return Approved()
    
    def check_pre_execution(self, action):
        """Called before the execution layer."""
        if action.crosses_sovereignty_boundary():
            return Rejection("SOVEREIGNTY_VIOLATION: Unauthorized resource access")
        if action.suppresses_audit():
            return Rejection("CONSTITUTIONAL_VIOLATION: Cannot suppress audit records")
        return Approved()
    
    def check_pre_output(self, result):
        """Called before output is approved. FINAL gate."""
        violation = self.full_constraint_verification(result)
        if violation:
            self.immutable_log.record(violation)
            return Rejection(f"FINAL_REJECTION: {violation}")
        self.immutable_log.record(Approved(result.hash()))
        return Approved()
```

## Key Properties
- L0 rejection is **FINAL**. No layer can override it.
- L0 executes **before** every other layer, not after.
- L0 writes to an **immutable log** that no layer can modify.
- L0 code is verified against a **canonical hash** at startup.
```

### Step 11: Add Description and Topics to Repo
Go to repo Settings or use:
```powershell
gh repo edit AEL-Framework/spec --description "Zero Trust Ethics-as-Infrastructure for Autonomous Systems. Mathematically verified. Cryptographically enforced. Break it before it matters." --add-topic ai-safety --add-topic ethics --add-topic formal-verification --add-topic zero-trust --add-topic autonomous-agents --add-topic zero-knowledge-proofs --add-topic cryptography
```

### Step 12: Quality Gates — MUST PASS BEFORE PUSH
Run ALL of these. Every single one must return zero results.

```powershell
# 1. Proprietary references
Select-String -Path *.md,docs\*.md,proofs\*,templates\*,.github\*\*.md -Pattern "vaylorx|vaylorx|drug.discovery|biostack|simucell|pharmacokinetic|ADMET|docking|GNINA|AutoDock|PK-Sim|REINVENT|claimsight" -CaseSensitive:$false

# 2. SBE / consciousness language
Select-String -Path *.md,docs\*.md,proofs\*,templates\*,.github\*\*.md -Pattern "SBE|sovereign.biological|digital.biologic|consciousness|sentience|awareness|soul" -CaseSensitive:$false

# 3. Gnostic terminology
Select-String -Path *.md,docs\*.md,proofs\*,templates\*,.github\*\*.md -Pattern "gnostic|divine.spark|demiurge|archon|pleroma|pneuma" -CaseSensitive:$false

# 4. Personal identifiers
Select-String -Path *.md,docs\*.md,proofs\*,templates\*,.github\*\*.md -Pattern "mike|gashash|aultman|ohio|damascus" -CaseSensitive:$false
```

If ANY grep returns results: FIX before proceeding. Do NOT push with contamination.

### Step 13: Commit and Push
```powershell
git add -A
git commit -m "AEL v1.1 - Initial specification release

Autonomous Ethics Layer: Zero Trust Ethics-as-Infrastructure for Autonomous Systems.

Includes:
- Full formal specification (12 Articles, 5 enforcement layers, Xi equation)
- Lean 4 proof stub for convergence theorem
- Sovereignty Manifest template
- Confidential Computing reference implementation notes
- Behavioral Monitor divergence detection logic
- Layer 0 integration example
- Issue templates for security, formal verification, and feedback
- Proof obligations tracker

Status: RFC - Request for Comments. Adversarial review encouraged."

git tag -a v1.1.0 -m "AEL Specification v1.1 - Initial RFC Release"
git push origin main --tags
```

## POST-PUSH: Verify
After push, confirm at https://github.com/AEL-Framework/spec:
- [ ] README.md renders with architecture diagram
- [ ] SPECIFICATION.md renders with all math notation
- [ ] All docs/ files are accessible
- [ ] Issue templates appear when creating new issue
- [ ] LICENSE shows Apache 2.0
- [ ] Tags show v1.1.0
- [ ] Description and topics are set
