module break_record_time264_24(pixels);

	//24*264
	output reg [246*290-1:0] pixels;
	always
	begin
		
		pixels[001*264-1:000*264]=264'b000001111111000000111111110000011111100000001111111100001111111111110000001111111100000000000000001111111111110011100000011100011111111110001111111111110000000000000000000001111111001111111111110011111000111100000111111000001111111111110000001111111100000111111111;
		pixels[002*264-1:001*264]=264'b000111111111000011111111110000111111110000011111111110001111111111110000111111111100000000000000001111111111110011100000011100011111111110001111111111110000000000000000000111111111001111111111110011110000011100001111111100001111111111110000111111111100001111111111;
		pixels[003*264-1:002*264]=264'b001111111111000111111111110001111111111000111111111111001111111111110001111111111100000000000000001111111111110011110000111100000011110000001111111111110000000000000000001111111111001111111111110011110000011100011111111110001111111111110001111111111100011111111111;
		pixels[004*264-1:003*264]=264'b011110000111001111111111110011111111111100111111111111001100000001110011111111111100000000000000001100000001110011110000111100000011110000000000111100000000000000000000011110000111001100000001110001111000011100011111111110001100000001110011111111111100111000000111;
		pixels[005*264-1:004*264]=264'b011100000111001111000011110011110000111100111000000111000000000001110011110000111100000000000000000000000001110011111001111100000011110000000000111100000000000000000000011100000111000000000001110001111100011100111000000111000000000001110011110000111100111000000111;
		pixels[006*264-1:005*264]=264'b111100000111001110000001110011100000011100111000000111000000000001110011100000011100000000000000000000000001110011011001111100000011110000000000111100000000000000000000111100000111000000000001110000111110011100111000000111000000000001110011100000011100111000000111;
		pixels[007*264-1:006*264]=264'b111000000111001110000001110011100000011100111000000111000000000001110011100000011100000000000000000000000001110011011111101100000011110000000000111100000000000000000000111000000111000000000001110000011111011100111000000111000000000001110011100000011100111000000111;
		pixels[008*264-1:007*264]=264'b111000000111001110000001110011100000011100000000000111000000000001110011100000011100000000000000000000000001110011011111101100000011110000000000111100000000000000000000111000000111000000000001110000001111111100111000000111000000000001110011100000011100111000000111;
		pixels[009*264-1:008*264]=264'b111000000111001110000001110011100000011100000000000111000000000001110011100000011100000000000000000000000001110011011111101100000011110000000000111100000000000000000000111000000111000000000001110000000111111100111000000111000000000001110011100000011100111000000111;
		pixels[010*264-1:009*264]=264'b111000000111001110000001110011100000011100000000000111000000000001110011100000011100000000000000000000000001110011001111001100000011110000000000111100000000000000000000111000000111000000000001110000000011111100111000000111000000000001110011100000011100111000000111;
		pixels[011*264-1:010*264]=264'b111000000111001111000011110011100000011100000000000111001111111111110011110000111100000000000000001111111111110011001111001100000011110000000000111100000000000000000000111000000111001111111111110000000001111100111000000111001111111111110011110000111100011111111111;
		pixels[012*264-1:011*264]=264'b111000000111000111111111110011100000011100000000000111001111111111110001111111111100000000000000001111111111110011000110001100000011110000000000111100000000000000000000111000000111001111111111110000000000111100111111111111001111111111110001111111111100001111111111;
		pixels[013*264-1:012*264]=264'b111000000111000011111111110011100000011100000000000111001111111111110000111111111100000000000000001111111111110011000110001100000011110000000000111100000000000000000000111000000111001111111111110000000000111100111111111111001111111111110000111111111100011111111111;
		pixels[014*264-1:013*264]=264'b111000000111000001111111110011100000011100000000000111000000000001110000011111111100000000000000000000000001110011000000001100000011110000000000111100000000000000000000111000000111000000000001110000000001111100111111111111000000000001110000011111111100111000000111;
		pixels[015*264-1:014*264]=264'b111000000111000000000011110011100000011100000000000111000000000001110000000000111100000000000000000000000001110011000000001100000011110000000000111100000000000000000000111000000111000000000001110000000011111100111000000111000000000001110000000000111100111000000111;
		pixels[016*264-1:015*264]=264'b111000000111000000000111110011100000011100000000000111000000000001110000000001111100000000000000000000000001110011000000001100000011110000000000111100000000000000000000111000000111000000000001110000000111111100111000000111000000000001110000000001111100111000000111;
		pixels[017*264-1:016*264]=264'b111000000111000000001111110011100000011100000000000111000000000001110000000011111100000000000000000000000001110011000000001100000011110000000000111100000000000000000000111000000111000000000001110000001111111100111000000111000000000001110000000011111100111000000111;
		pixels[018*264-1:017*264]=264'b111000000111000000011111110011100000011100000000000111000000000001110000000111111100000000000000000000000001110011000000001100000011110000000000111100000000000000000000111000000111000000000001110000011111011100111000000111000000000001110000000111111100111000000111;
		pixels[019*264-1:018*264]=264'b111000000111000000111101110011100000011100110000000111000000000001110000001111011100000000000000000000000001110011000000001100000011110000000000111100000000000000000000111000000111000000000001110000111110011100111000000111000000000001110000001111011100111000000111;
		pixels[020*264-1:019*264]=264'b111100000111000001111001110011110000111100110000000111000000000001110000011110011100000000000000000000000001110011000000001100000011110000000000111100000000000000000000111100000111000000000001110001111100011100111000000111000000000001110000011110011100111000000111;
		pixels[021*264-1:020*264]=264'b011110000111000011110001110011111001111100111111111111001100000001110000111100011100000000000000001100000001110011000000001100000011110000000000111100000000000000000000011110000111001100000001110001111000011100111000000111001100000001110000111100011100111000000111;
		pixels[022*264-1:021*264]=264'b011111111111000111100001110001111111111000111111111111001111111111110001111000011100000000000000001111111111110011000000001100000011110000000000111100000000000000000000011111111111001111111111110011110000011100111000000111001111111111110001111000011100111111111111;
		pixels[023*264-1:022*264]=264'b001111111111001111000001110000111111110000011111111110001111111111110011110000011100000000000000001111111111110011000000001100011111111110000000111100000000000000000000001111111111001111111111110011110000011100111000000111001111111111110011110000011100011111111111;
		pixels[024*264-1:023*264]=264'b000011111111001111100011110000011111100000001111111100001111111111110011111000111100000000000000001111111111110011100000011100011111111110000000111100000000000000000000000011111111001111111111110011111000111100111000000111001111111111110011111000111100001111111111;

	end
endmodule