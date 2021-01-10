module VGAHandler (VGAClock, VGA_R, VGA_G, VGA_B, VGA_VS, VGA_HS, LINE_SEQ, LINE, FRAME_READY);
	input VGAClock;
	output reg [3:0] VGA_R, VGA_G, VGA_B;
	output reg VGA_VS, VGA_HS;
	
	output reg [15:0] LINE_SEQ;
	input [639:0] LINE;
	reg [639:0] nowLine;
	
	output reg FRAME_READY;
	
	//0:vaild pixels, 1:front porch, 2:sync pulse, 3:back porch
	reg[3:0] H_Status;
	//0:vaild lines, 1:front porch, 2:sync pulse, 3:back porch, 4:back porch(last line)
	reg[3:0] V_Status;
	
	reg [15:0] h_pos;
	reg [15:0] v_pos;
	
	reg [15:0] h_counter;
	reg [15:0] v_counter;
	
	
	initial
	begin
		H_Status<=0;
		V_Status<=0;
		h_pos<=0;
		v_pos<=0;
		
		h_counter<=0;
		v_counter<=0;
		
		nowLine<=640'b0;
		
		FRAME_READY<=0;
	end

	
	always @(posedge VGAClock)
	begin
	
		VGA_R<=0;
		VGA_G<=0;
		VGA_B<=0;
		
		case(H_Status)
		0:begin
			VGA_HS<=1;
			
			if(V_Status==0)
			begin
				if(nowLine[h_pos])
				begin
					VGA_R<=15;
					VGA_G<=15;
					VGA_B<=15;
				end
				else
				begin
					VGA_R<=0;
					VGA_G<=0;
					VGA_B<=0;
				end
			end
			else
			begin
				VGA_R<=0;
				VGA_G<=0;
				VGA_B<=0;
			end
			
			h_pos<=h_pos+1;
			if(h_pos>=640)
			begin
				H_Status<=1;
				h_counter<=0;
				if(V_Status==0)
				begin
					LINE_SEQ<=v_pos+1;
				end
				
			end
		end
		
		1:begin
			VGA_HS<=1;
			h_counter<=h_counter+1;
			if(h_counter>=16)
			begin
				H_Status<=2;
				h_counter<=0;
			end
		end
		
		2:begin
			VGA_HS<=0;
			h_counter<=h_counter+1;
			if(h_counter>=96)
			begin
				H_Status<=3;
				h_counter<=0;
				
				nowLine<=LINE;
			end
		end
				
		3:begin
			VGA_HS<=1;
			h_counter<=h_counter+1;
			if(h_counter>=48)
			begin						
				h_counter<=0;
				h_pos<=0;
				H_Status<=0;
				v_pos<=v_pos+1;
				v_counter<=v_counter+1;
				
			end
		end			
	endcase
	
	case (V_Status)
		0:begin
			VGA_VS<=1;
			
			if(v_pos>=480)
			begin
				v_pos<=0;
				v_counter<=0;
				V_Status<=1;		
				FRAME_READY<=1;				
			end
		end
		1:begin
			VGA_VS<=1;		
			if(v_counter>=10)
			begin
				v_pos<=0;				
				v_counter<=0;
				V_Status<=2;
			end			
		end
		2:begin
			VGA_VS<=0;
			if(v_counter>=2)
			begin
				v_pos<=0;
				v_counter<=0;
				V_Status<=3;
				LINE_SEQ <= 0;
			end	
		end
		3:begin
			VGA_VS<=1;
			if(v_counter>=32)
			begin
				v_pos<=0;
				v_counter<=0;
				V_Status<=4;
				FRAME_READY<=0;				
				
				nowLine<=LINE;
			end	
		end
		
		4:begin
			VGA_VS<=1;
			if(v_counter>=1)
			begin
				v_pos<=0;
				v_counter<=0;
				V_Status<=0;
				
			end	
		end
	endcase
	
	end
endmodule