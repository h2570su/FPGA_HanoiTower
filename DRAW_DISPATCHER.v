module draw_Dispatcher(CLK, DATA_DONE, Q, Count, DRAW);
input CLK, DATA_DONE;
output reg Q, DRAW;
output reg [31:0] Count;

initial 
begin
	Count<=0;
	Q<=1;
end

always @(posedge CLK)
begin
	if(DATA_DONE)
	begin
		Q<=0;
		Count<=0;
		DRAW<=0;
	end
	else
	begin
		if(!Q)
		begin
			Count<=Count+1;
			DRAW<=1;
			if(Count>3)
			begin
				Q<=1;
			end
		end
		else
		begin
			
		end
	end
end

endmodule