# verilog_practice
this verilog repo is my commitment to cover  the all basic stuffs and syntax of the verilog in one week +1-2 days more if required and will upload the projects made with the verilog in this repo too.
---
# 8 day study plan for verilog hdl

| Day | Topics & Reading (Palnitkar) | Hands-On / Exercises | Notion Checklist Item |
| --- | --- | --- | --- |
| **1** | **Data Types & Lexical**• Ch 3: Data Types (`wire`, `reg`, vectors)• Review Lexical Conventions (Ch 2) | • In EDA Playground, declare/simulate:  – `wire [3:0] a; reg [7:0] mem[0:15];`  – Continuous `assign` vs procedural `=`/`<=` | ☐ Read Ch 3; practice `wire`/`reg` declarations |
| **2** | **Modules, Ports & Operators**• Ch 4: Modules & Ports• Ch 5: Gate-Level Modeling (skim) | • Build a 2:1 mux in both gate-level and dataflow styles:  – Gate: `and/or/not`  – Dataflow: `assign out = …` | ☐ Implement mux in two styles |
| **3** | **Dataflow & Behavioral**• Ch 6: Dataflow Modeling• Ch 7: Behavioral Modeling | • Write & simulate:  – 4-bit adder (dataflow)  – 4-bit adder (behavioral `always @(*)`) | ☐ Code + simulate both adder styles |
| **4** | **Procedural Blocks & Timing**• Ch 8: Tasks & Functions (intro)• Review `always`, `initial`, `#` delays | • Create a simple testbench for your adder:  – Use `$display`, `$monitor`  – Apply stimulus with `initial` + delays | ☐ Write testbench with stimulus & monitor |
| **5** | **Sequential Logic**• Ch 9: Testbenches (focus on sequential examples)• Flip-flops + FSM primer | • Implement:  – D-FF with sync & async reset  – 2-state FSM (traffic light) in Verilog + simulate | ☐ Build & verify D-FF + simple FSM |
| **6** | **Finite State Machines**• Revisit FSMs in Ch 9 examples• Study encoding styles (binary vs one-hot) | • Code a 3-state “up/down” counter FSM:  – Use one-hot encoding  – Simulate and waveform-check transitions | ☐ Complete 3-state FSM with one-hot |
| **7** | **Putting It All Together**• Quick skim Ch 12: Verilog HDL examples | • Choose **one** mini-project: 1. 4-bit ALU (add, sub, AND, OR) 2. UART transmitter (serial) module– Write RTL + testbench | ☐ Start mini-project (#1 or #2) |
| **8** | **Project Wrap & Review**• Review any weak spots; revisit book sections as needed | • Finish chosen mini-project; push to GitHub• Write README explaining modules, testbench, and how to run simulations | ☐ Complete project & GitHub repo |
