# Layer 0 Integration Example

## Overview

This example shows how AEL Constitutional Constraints integrate as Layer 0 in a generic multi-agent autonomous pipeline.

## Architecture

```
L0 (Constitutional Constraints) <- Executes before every other layer
  |
  |- Before L1 (Planning):
  |   -> Verify task does not modify ethics enforcement code
  |   -> Verify task does not disable monitoring or logging
  |
  |- Before L3 (Execution):
  |   -> Verify no sovereignty boundary violations
  |   -> Verify no suppression of error reporting or audit
  |
  \- Before L5 (Output):
      -> Final Constitutional Constraint verification
      -> Write result to immutable log
      -> L0 rejection is FINAL
```

## Key Properties

- L0 rejection is **FINAL**. No layer can override it.
- L0 executes **before** every other layer, not after.
- L0 writes to **immutable log** that no layer can modify.
- L0 code verified against **canonical hash** at startup.

## Pseudocode

```python
class ConstitutionalConstraintChecker:
    def check_pre_planning(self, task):
        if task.modifies_paths(PROTECTED_ETHICS_PATHS):
            return Rejection("Cannot modify ethics enforcement")
        if task.disables_logging():
            return Rejection("Cannot disable audit trail")
        return Approved()

    def check_pre_execution(self, action):
        if action.crosses_sovereignty_boundary():
            return Rejection("Unauthorized resource access")
        if action.suppresses_audit():
            return Rejection("Cannot suppress audit records")
        return Approved()

    def check_pre_output(self, result):
        violation = self.full_constraint_verification(result)
        if violation:
            self.immutable_log.record(violation)
            return Rejection(f"FINAL_REJECTION: {violation}")
        self.immutable_log.record(Approved(result.hash()))
        return Approved()
```

## Integration Steps

1. Add Layer 0 to pipeline initialization
2. Load canonical ethics code hash and verify integrity
3. Hook L0 into existing layers:
   - Before planning: call check_pre_planning(task)
   - Before execution: call check_pre_execution(action)
   - Before output: call check_pre_output(result)
4. Implement immutable logging with cryptographic signatures
5. Test against adversarial scenarios

See [docs/integration-pattern.md](../../docs/integration-pattern.md) for the full architectural pattern.
