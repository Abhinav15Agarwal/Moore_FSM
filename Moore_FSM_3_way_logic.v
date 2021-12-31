`timescale 1ns / 1ps

module moore_machine(
    input clk,rst,din,
    output reg dout
    );
    
parameter state0 = 0;
parameter state1 = 1;

reg state, next_state;

//Reset Logic - Sequential Logic (use of clock)

always@(posedge clk or posedge rst)
begin
if(rst)
state <= state0;
else
state = next_state;
end

//Next State decode - Combinationl Logic (No clock)

always@(state or din)
begin
case(state)

state0: begin
if(din)
next_state = state1;
else
next_state = state0;
end

state1: begin
if(din)
next_state = state0;
else
next_state = state1;
end
endcase
end
//Output Decode Logic
always@(state)   //Moore only depends on current state
begin
case(state)
state0: dout = 1'b0;
state1: dout = 1'b1;
endcase
end
endmodule
