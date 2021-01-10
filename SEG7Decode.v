module intTo4SEG(value, SEG);
	input[15:0] value;
	output [31:0] SEG;
	byte2Seg7 m0(value/1000,SEG[31:24]);
	byte2Seg7 m1((value%1000)/100,SEG[23:16]);
	byte2Seg7 m2((value%100)/10,SEG[15:8]);
	byte2Seg7 m3(value%10,SEG[7:0]);
	
endmodule

module byte2Seg7(digit, seg);
	input [3:0] digit;
	output reg [7:0] seg;
	always
	begin
		case (digit)
		0:seg= 8'b11000000;
		1:seg= 8'b11111001;
		2:seg= 8'b10100100;
		3:seg= 8'b10110000;
		4:seg= 8'b10011001;
		5:seg= 8'b10010010;
		6:seg= 8'b10000010;
		7:seg= 8'b11011000;
		8:seg= 8'b10000000;
		9:seg= 8'b10010000;
		endcase
	end
endmodule