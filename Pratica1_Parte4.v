module DEC_7seg (num, disp);
	input [2:0] num;
	output [7:0] disp;
	
	
	assign disp[0]= ~(~num[0]&~num[1]&~num[2] | num[0]&~num[1]&~num[2]);
	assign disp[1]= ~(~num[2]);
	assign disp[2]= ~(~num[2]);
	assign disp[3]= ~(num[0]&~num[1]&~num[2] | ~num[0]&num[1]&~num[2] | num[0]&num[1]&~num[2]);
	assign disp[4]= ~(~num[0]&~num[1]&~num[2] | num[0]&num[1]&~num[2]);
	assign disp[5]= ~(~num[0]&~num[1]&~num[2] | num[0]&num[1]&~num[2]);
	assign disp[6]= ~(num[0]&~num[1]&~num[2] | num[0]&num[1]&~num[2]);

endmodule


module Pratica1_Parte4 (SW,HEX0,HEX1,HEX2,HEX3);
	input [2:0] SW;
	output [7:0] HEX0,HEX1,HEX2,HEX3;
	
	DEC_7seg DEC3 ({2'b0,SW[2:0]},HEX3);
	DEC_7seg DEC2 ({2'b0,SW[2:0]},HEX2);
	DEC_7seg DEC1 ({2'b0,SW[2:0]},HEX1);
	DEC_7seg DEC0 ({2'b0,SW[2:0]},HEX0);
	
endmodule
