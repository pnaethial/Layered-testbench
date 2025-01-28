# Layered-testbench
Verification of FSM logic using System Verilog on EDA
# FSM-Based Sequence Detector for Longest Prefix Match

## Overview
A **Finite State Machine (FSM)-based sequence detector** is a hardware design that identifies specific sequences in input streams. When applied to the **Longest Prefix Match (LPM)** problem, it ensures accurate identification of the longest matching prefix from a set of predefined patterns. 

## Layered Testbench Architecture
To verify the FSM-based sequence detector, a **layered testbench** is employed. This approach ensures scalable testing by breaking the verification process into distinct layers. Each layer performs a specific task to validate the FSM design thoroughly.

### Key Components of the Layered Testbench:
1. **Packet**:
   - A structured entity (such as a SystemVerilog struct) used to define the inputs and outputs of the FSM.
   - Encapsulates input sequences and expected outputs, ensuring consistent and organized communication between testbench components.
   
2. **Generator (Stimulus Generator)**:
   - Generates input sequences to simulate real-world scenarios.
   - Ensures edge cases, random inputs, and corner conditions are tested.
     
3. **Driver**:
   - Drives the generated input sequences (from the generator) to the DUT (Design Under Test).
   - Converts high-level input packets into low-level signals suitable for FSM input.
   
4. **Monitor**:
   - Observes the FSM's output and captures the behavior.
   - Collects results for further analysis.
    
5. **Reference Model**:
   - A behavioral or software model of the FSM used to calculate the expected outputs.
   - Acts as the golden reference for comparing the actual FSM outputs.

6. **Scoreboard**:
   - Compares the FSM's actual output against expected results.
   - Flags mismatches for debugging purposes.
     
7. **Environment**:
   - Combines all components into a unified framework.
   - Manages the communication between the driver, monitor, and scoreboard.

## Applications
1. **Networking**:
   - Used in IP routing to find the best matching route in a routing table.
2. **Data Processing**:
   - Helps in pattern matching for streams of data, such as DNA sequencing or text search.
3. **Real-Time Systems**:
   - Critical in low-latency systems requiring deterministic behavior.
