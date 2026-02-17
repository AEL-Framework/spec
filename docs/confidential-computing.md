# Layer 0: Confidential Computing Reference Implementation

> Reference implementation notes for Â§4.2 (Hardware Attestation).

## Overview

The hardware attestation described in Â§4.2 (Layer 0) is best realized through Confidential Computing Enclaves in current infrastructure. By running the AEL enforcement code within a TEE (Trusted Execution Environment), the system provides hardware-rooted cryptographic proof that the ethics layer is active and untampered, even if the host OS or cloud provider is compromised.

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

TEEs protect code integrity but not against side-channel attacks on the TEE itself. Spectre/Meltdown class vulnerabilities have historically affected SGX. The Turtles Problem (Â§10.3) still applies â€” the TEE manufacturer is a trust root that cannot be independently verified.
