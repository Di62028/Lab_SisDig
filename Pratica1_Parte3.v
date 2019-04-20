module MUX51(u, v, w, x, y, s0, s1, s2, m20);
	input u,v,w,x,y,s0,s1,s2;
	output m20;

	assign m01 = (~s0 & u) | (s0 & v);
	assign m02 = (~s0 & w) | (s0 & x);
	
	assign m10 = (~s1 & m01) | (s1 & m02);
	
	assign m20 = (~s2 & m10) | (s2 & y);

endmodule

module acende_vermelho(entrada, saida);
	input entrada;
	output saida;
	
	assign saida = (entrada);

endmodule
	
module MUX3bits_5_1 (U, V, W, X, Y, S0, S1, S2, M, A_V);
	input [2:0] U,V,W,X,Y;
	input S0,S1,S2;
	output [2:0] M;
	output [17:0] A_V;

	MUX51 mux0(U[0], V[0], W[0], X[0], Y[0], S0, S1, S2, M[0]);
	MUX51 mux1(U[1], V[1], W[1], X[1], Y[1], S0, S1, S2, M[1]);
	MUX51 mux2(U[2], V[2], W[2], X[2], Y[2], S0, S1, S2, M[2]);
	
	
	acende_vermelho a_v0(U[0], A_V[0]);
	acende_vermelho a_v1(U[1], A_V[1]);
	acende_vermelho a_v2(U[2], A_V[2]);
	
	acende_vermelho a_v3(V[0], A_V[3]);
	acende_vermelho a_v4(V[1], A_V[4]);
	acende_vermelho a_v5(V[2], A_V[5]);
	
	acende_vermelho a_v6(W[0], A_V[6]);
	acende_vermelho a_v7(W[1], A_V[7]);
	acende_vermelho a_v8(W[2], A_V[8]);
	
	acende_vermelho a_v9(X[0], A_V[9]);
	acende_vermelho a_v10(X[1], A_V[10]);
	acende_vermelho a_v11(X[2], A_V[11]);
	
	acende_vermelho a_v12(Y[0], A_V[12]);
	acende_vermelho a_v13(Y[1], A_V[13]);
	acende_vermelho a_v14(Y[2], A_V[14]);
	
	acende_vermelho a_v15(S0, A_V[15]);
	
	acende_vermelho a_v16(S1, A_V[16]);
	
	acende_vermelho a_v17(S2, A_V[17]);

endmodule


module Pratica1_Parte3 (SW, LEDR, LEDG);
	input [17:0] SW;
	output [17:0] LEDR;
	output [7:0] LEDG;

	MUX3bits_5_1 parte_3(SW[2:0],SW[5:3],SW[8:6],SW[11:9],SW[14:12],SW[15],SW[16],SW[17],LEDG[2:0],LEDR[17:0]);

endmodule
