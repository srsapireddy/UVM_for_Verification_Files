module mult(a,b, out)

	input [3:0]a,b;

	output reg [3:0]out;

 

	assign out = a*b;

endmodule