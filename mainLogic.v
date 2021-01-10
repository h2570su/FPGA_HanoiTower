module mainLogic(tick, PB1, PB2, PB3, RESET, SELECT, clock,
					  MOVES_COUNT,
					  DISKa_0, DISKa_1, DISKa_2, DISKa_3, DISKa_4, DISKa_5, DISKa_6, DISKa_7, DISKa_8, DISKa_9,
					  DISKb_0, DISKb_1, DISKb_2, DISKb_3, DISKb_4, DISKb_5, DISKb_6, DISKb_7, DISKb_8, DISKb_9,
					  DISKc_0, DISKc_1, DISKc_2, DISKc_3, DISKc_4, DISKc_5, DISKc_6, DISKc_7, DISKc_8, DISKc_9,
					  MOVES_NUM0, MOVES_NUM1, MOVES_NUM2, MOVES_NUM3,
					  TIME_NUM0, TIME_NUM1, TIME_NUM2, TIME_NUM3,
					  SEL1, SEL2, SEL3,
					  BEST_TIME_NUM0, BEST_TIME_NUM1, BEST_TIME_NUM2, BEST_TIME_NUM3,
					  BEST_MOVE_NUM0, BEST_MOVE_NUM1, BEST_MOVE_NUM2, BEST_MOVE_NUM3,
					  WON, REC_BREAK_TIME, REC_BREAK_MOVE
					  );
input tick, PB1, PB2, PB3, RESET;				
input clock;	  
input [2:0] SELECT;

output reg [15:0] MOVES_COUNT;
					  
output reg [3:0] DISKa_0, DISKa_1, DISKa_2, DISKa_3, DISKa_4, DISKa_5, DISKa_6, DISKa_7, DISKa_8, DISKa_9;
output reg [3:0] DISKb_0, DISKb_1, DISKb_2, DISKb_3, DISKb_4, DISKb_5, DISKb_6, DISKb_7, DISKb_8, DISKb_9;
output reg [3:0] DISKc_0, DISKc_1, DISKc_2, DISKc_3, DISKc_4, DISKc_5, DISKc_6, DISKc_7, DISKc_8, DISKc_9;	
output reg [7:0] SEL1, SEL2, SEL3;
output reg [7:0] BEST_TIME_NUM0, BEST_TIME_NUM1, BEST_TIME_NUM2, BEST_TIME_NUM3;
output reg [7:0] BEST_MOVE_NUM0, BEST_MOVE_NUM1, BEST_MOVE_NUM2, BEST_MOVE_NUM3;
reg [15:0] bestTime[9:0];
reg [15:0] bestMoves[9:0];

reg [3:0] DISKa[9:0];
reg [3:0] DISKb[9:0];
reg [3:0] DISKc[9:0];

reg [2:0] selected_select;

output reg [7:0] MOVES_NUM0, MOVES_NUM1, MOVES_NUM2, MOVES_NUM3;
output reg [7:0] TIME_NUM0, TIME_NUM1, TIME_NUM2, TIME_NUM3;

output reg WON, REC_BREAK_TIME, REC_BREAK_MOVE;

reg [15:0] el_time;

reg[3:0] Stack1_PTR, Stack2_PTR, Stack3_PTR;
integer SelectedPOS;
reg [3:0] SelectedDisk;

reg PB1_HANDLEED;
reg PB2_HANDLEED;
reg PB3_HANDLEED;
reg tick_HANDLEED;

reg [15:0] status;

reg [15:0] bestResetCounter;

initial 
begin
	el_time<=0;
	status<=0;
	bestMoves[0]<=0;
	bestTime[0]<=0;
	bestMoves[1]<=0;
	bestTime[1]<=0;
	bestMoves[2]<=0;
	bestTime[2]<=0;
	bestMoves[3]<=0;
	bestTime[3]<=0;
	bestMoves[4]<=0;
	bestTime[4]<=0;
	bestMoves[5]<=0;
	bestTime[5]<=0;
	bestMoves[6]<=0;
	bestTime[6]<=0;
	bestMoves[7]<=0;
	bestTime[7]<=0;
	bestMoves[8]<=0;
	bestTime[8]<=0;
	bestMoves[9]<=0;
	bestTime[9]<=0;
	Stack1_PTR<=0;
	Stack2_PTR<=0;
	Stack3_PTR<=0;
	bestResetCounter<=0;
end

always
begin
	
	TIME_NUM0=(el_time/60)/10;
	TIME_NUM1=(el_time/60)%10;
	TIME_NUM2=(el_time%60)/10;
	TIME_NUM3=(el_time%60)%10;
	
	MOVES_NUM0=MOVES_COUNT/1000;
	MOVES_NUM1=MOVES_COUNT%1000/100;
	MOVES_NUM2=MOVES_COUNT%100/10;
	MOVES_NUM3=MOVES_COUNT%10;
	
	BEST_TIME_NUM0=(bestTime[selected_select]/60)/10;
	BEST_TIME_NUM1=(bestTime[selected_select]/60)%10;
	BEST_TIME_NUM2=(bestTime[selected_select]%60)/10;
	BEST_TIME_NUM3=(bestTime[selected_select]%60)%10;
	
	BEST_MOVE_NUM0=bestMoves[selected_select]/1000;
	BEST_MOVE_NUM1=bestMoves[selected_select]%1000/100;
	BEST_MOVE_NUM2=bestMoves[selected_select]%100/10;
	BEST_MOVE_NUM3=bestMoves[selected_select]%10;
	
	DISKa_0=DISKa[0];
	DISKa_1=DISKa[1];
	DISKa_2=DISKa[2];
	DISKa_3=DISKa[3];
	DISKa_4=DISKa[4];
	DISKa_5=DISKa[5];
	DISKa_6=DISKa[6];
	DISKa_7=DISKa[7];
	DISKa_8=DISKa[8];
	DISKa_9=DISKa[9];
	
	DISKb_0=DISKb[0];
	DISKb_1=DISKb[1];
	DISKb_2=DISKb[2];
	DISKb_3=DISKb[3];
	DISKb_4=DISKb[4];
	DISKb_5=DISKb[5];
	DISKb_6=DISKb[6];
	DISKb_7=DISKb[7];
	DISKb_8=DISKb[8];
	DISKb_9=DISKb[9];
	
	DISKc_0=DISKc[0];
	DISKc_1=DISKc[1];
	DISKc_2=DISKc[2];
	DISKc_3=DISKc[3];
	DISKc_4=DISKc[4];
	DISKc_5=DISKc[5];
	DISKc_6=DISKc[6];
	DISKc_7=DISKc[7];
	DISKc_8=DISKc[8];
	DISKc_9=DISKc[9];
	
	SEL1 = (SelectedPOS==1)?38:-1;
	SEL2 = (SelectedPOS==2)?38:-1;
	SEL3 = (SelectedPOS==3)?38:-1;
	
	WON = (status==3)?1:0;
	
end				  



always @(posedge clock)
begin
	if(!PB1)
	begin
		PB1_HANDLEED<=0;
	end
	if(!PB2)
	begin
		PB2_HANDLEED<=0;
	end
	if(!PB3)
	begin
		PB3_HANDLEED<=0;
	end
	if(!tick)
	begin
		tick_HANDLEED<=0;
	end
	if(RESET)
	begin
		el_time<=0;
		status<=0;
		selected_select<=SELECT;
		SelectedPOS<=0;
		SelectedDisk<=0;
		Stack1_PTR<=SELECT;
		DISKa[0]<=(SELECT>0)?10-0:0;
		DISKa[1]<=(SELECT>1)?10-1:0;
		DISKa[2]<=(SELECT>2)?10-2:0;
		DISKa[3]<=(SELECT>3)?10-3:0;
		DISKa[4]<=(SELECT>4)?10-4:0;
		DISKa[5]<=(SELECT>5)?10-5:0;
		DISKa[6]<=(SELECT>6)?10-6:0;
		DISKa[7]<=(SELECT>7)?10-7:0;
		DISKa[8]<=(SELECT>8)?10-8:0;
		DISKa[9]<=(SELECT>9)?10-9:0;
		
		Stack2_PTR<=0;
		Stack3_PTR<=0;
		
		DISKb[0]<=0;
		DISKb[1]<=0;
		DISKb[2]<=0;
		DISKb[3]<=0;
		DISKb[4]<=0;
		DISKb[5]<=0;
		DISKb[6]<=0;
		DISKb[7]<=0;
		DISKb[8]<=0;
		DISKb[9]<=0;
		
		DISKc[0]<=0;
		DISKc[1]<=0;
		DISKc[2]<=0;
		DISKc[3]<=0;
		DISKc[4]<=0;
		DISKc[5]<=0;
		DISKc[6]<=0;
		DISKc[7]<=0;
		DISKc[8]<=0;
		DISKc[9]<=0;
		
		MOVES_COUNT<=0;
		REC_BREAK_MOVE<=0;
		REC_BREAK_TIME<=0;
	end
//status: 0:before start, 1	started_idle, 2 selected_idle, 3 done
	
	if(PB1&&!PB1_HANDLEED)
	begin
		PB1_HANDLEED<=1;
		if(status==0)
		begin
			status<=1;
		end
		
		case(status)
		1:begin
			if(Stack1_PTR>0)
			begin
				SelectedPOS<=1;			
				SelectedDisk<=DISKa[Stack1_PTR-1];
				status<=2;
			end
		end
		2:begin
			case(SelectedPOS)
			1:begin
				SelectedPOS<=0;
				status<=1;
			end
			2:begin
				if(DISKa[Stack1_PTR-1]>SelectedDisk||Stack1_PTR==0)
				begin
					DISKa[Stack1_PTR]<=SelectedDisk;
					Stack1_PTR<=Stack1_PTR+1;
					
					DISKb[Stack2_PTR-1]<=0;
					Stack2_PTR<=Stack2_PTR-1;						
					SelectedPOS<=0;
					status<=1;
					MOVES_COUNT<=MOVES_COUNT+1;	
				end
			end
			3:begin
				if(DISKa[Stack1_PTR-1]>SelectedDisk||Stack1_PTR==0)
				begin
					DISKa[Stack1_PTR]<=SelectedDisk;
					Stack1_PTR<=Stack1_PTR+1;
					
					DISKc[Stack3_PTR-1]<=0;
					Stack3_PTR<=Stack3_PTR-1;						
					SelectedPOS<=0;
					status<=1;
					MOVES_COUNT<=MOVES_COUNT+1;	
				end		
			end
			endcase			
		end
		endcase
	end
		
	if(PB2&&!PB2_HANDLEED)
	begin
		PB2_HANDLEED<=1;	
		if(status==0)
		begin
			status<=1;
		end
		
		case(status)
		1:begin
			if(Stack2_PTR>0)
			begin
				SelectedPOS<=2;			
				SelectedDisk<=DISKb[Stack2_PTR-1];
				status<=2;
			end		
		end
		2:begin
			case(SelectedPOS)
			1:begin
				if(DISKb[Stack2_PTR-1]>SelectedDisk||Stack2_PTR==0)
				begin
					DISKb[Stack2_PTR]<=SelectedDisk;
					Stack2_PTR<=Stack2_PTR+1;
					
					DISKa[Stack1_PTR-1]<=0;
					Stack1_PTR<=Stack1_PTR-1;						
					SelectedPOS<=0;
					status<=1;
					MOVES_COUNT<=MOVES_COUNT+1;						
				end
			end
			2:begin
				SelectedPOS<=0;
				status<=1;
			end
			3:begin
				if(DISKb[Stack2_PTR-1]>SelectedDisk||Stack2_PTR==0)
				begin
					DISKb[Stack2_PTR]<=SelectedDisk;
					Stack2_PTR<=Stack2_PTR+1;
					
					DISKc[Stack3_PTR-1]<=0;
					Stack3_PTR<=Stack3_PTR-1;						
					SelectedPOS<=0;
					status<=1;
					MOVES_COUNT<=MOVES_COUNT+1;						
				end		
			end
			endcase
		end
		endcase
	end
		
	if(PB3&&!PB3_HANDLEED)
	begin
		PB3_HANDLEED<=1;	
		if(status==0)
		begin
			status<=1;
		end
		
		case(status)
		1:begin
			if(Stack3_PTR>0)
			begin
				SelectedPOS<=3;		
				SelectedDisk<=DISKc[Stack3_PTR-1];	
				status<=2;
			end		
		end
		2:begin
			case(SelectedPOS)				
			1:begin
				if(DISKc[Stack3_PTR-1]>SelectedDisk||Stack3_PTR==0)
				begin
					DISKc[Stack3_PTR]<=SelectedDisk;
					Stack3_PTR<=Stack3_PTR+1;
					
					DISKa[Stack1_PTR-1]<=0;
					Stack1_PTR<=Stack1_PTR-1;
					SelectedPOS<=0;		
					status<=1;
					MOVES_COUNT<=MOVES_COUNT+1;	
				end
			end
			2:begin
				if(DISKc[Stack3_PTR-1]>SelectedDisk||Stack3_PTR==0)
				begin
					DISKc[Stack3_PTR]<=SelectedDisk;
					Stack3_PTR<=Stack3_PTR+1;
					
					DISKb[Stack2_PTR-1]<=0;		
					Stack2_PTR<=Stack2_PTR-1;					
					SelectedPOS<=0;
					status<=1;	
					MOVES_COUNT<=MOVES_COUNT+1;	
				end
			end
			3:begin
				SelectedPOS<=0;
				status<=1;
			end
			endcase
		end
		endcase
	end
	
	if(Stack3_PTR>=selected_select)
	begin
		status<=3;
		if(MOVES_COUNT<bestMoves[selected_select]||bestMoves[selected_select]==0)
		begin
			bestMoves[selected_select]<=MOVES_COUNT;
			REC_BREAK_MOVE<=1;		
		end
		
		if(el_time<bestTime[selected_select]||bestTime[selected_select]==0)
		begin
			bestTime[selected_select]<=el_time;
			REC_BREAK_TIME<=1;
		end
	end
	
	
	
	if(tick&&!tick_HANDLEED)
	begin
		tick_HANDLEED<=1;	
		if(!RESET&&!(status==0||status==3))
		begin
			el_time<=el_time+1;
		end
		if(RESET)
		begin		
			bestResetCounter<=bestResetCounter+1;
			if(bestResetCounter>=5)
			begin
				bestResetCounter<=0;
				bestMoves[0]<=0;
				bestTime[0]<=0;
				bestMoves[1]<=0;
				bestTime[1]<=0;
				bestMoves[2]<=0;
				bestTime[2]<=0;
				bestMoves[3]<=0;
				bestTime[3]<=0;
				bestMoves[4]<=0;
				bestTime[4]<=0;
				bestMoves[5]<=0;
				bestTime[5]<=0;
				bestMoves[6]<=0;
				bestTime[6]<=0;
				bestMoves[7]<=0;
				bestTime[7]<=0;
				bestMoves[8]<=0;
				bestTime[8]<=0;
				bestMoves[9]<=0;
				bestTime[9]<=0;
			end
		end
		else
		begin
			bestResetCounter<=0;
		end
	end
end
endmodule