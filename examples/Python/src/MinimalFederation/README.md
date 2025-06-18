# Minimal Python Federation Example

This directory contains a minimal Python federation example demonstrating basic federated execution concepts in Lingua Franca.

## Overview

The `CountPrint.lf` example implements a simple federated system with two reactors:
- **Count**: A timer-driven reactor that generates incremental integers every second
- **Print**: A reactor that receives and displays the integers with logical time information

This example demonstrates:
- RTI (Runtime Infrastructure) coordination
- Logical time synchronization between federates
- Message passing across federate boundaries
- Basic federation lifecycle management

## Prerequisites

Ensure you have the LF development environment activated:
```bash
cd /path/to/playground-lingua-franca
source utils/scripts/activate-lf-dev-env.bash
```

## Compilation

To compile the federation example:
```bash
cd examples/Python/src/MinimalFederation
lfc CountPrint.lf
```

This will generate:
- Federate binaries for Count and Print reactors
- RTI (Runtime Infrastructure) binary
- Launch script in `examples/Python/bin/CountPrint`

## Execution

To run the federation:
```bash
cd examples/Python/bin
./CountPrint
```

## Expected Output

The federation will:
1. Start the RTI (Runtime Infrastructure)
2. Launch both federates (Count and Print)
3. Display periodic messages showing:
   - The incremental count values
   - Logical time at which each message was received
   - Microstep information for deterministic execution

Example output:
```
RTI: Federation ID: [federation-id]
RTI: Number of federates: 2
RTI: Listening for federates.
Received: 0 at logical time (0 ms, 0)
Received: 1 at logical time (1000 ms, 0)
Received: 2 at logical time (2000 ms, 0)
...
```

## Key Concepts Demonstrated

- **Federation**: Using the `federated reactor` keyword to create distributed execution
- **RTI Coordination**: Automatic startup and coordination of the Runtime Infrastructure
- **Logical Time**: Deterministic timing across distributed federates
- **Message Passing**: Communication between federates using input/output ports
- **Timer-driven Execution**: Periodic execution using timer reactions

## Based On

This example follows the minimal federation pattern from the official LF-Lang documentation:
https://www.lf-lang.org/docs/next/writing-reactors/distributed-execution/
