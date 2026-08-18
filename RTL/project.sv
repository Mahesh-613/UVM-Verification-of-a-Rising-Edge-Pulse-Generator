module project(
	input logic clk,
	input logic rst,
	input logic signal_in,

	output logic pulse_out);

	logic pre_in; //Store previous input

always @(posedge clk or posedge rst) begin
		if(rst) begin
			pre_in <= 1'b0;
		        pulse_out <= 1'b0;
		end
			else begin
	        	pulse_out <= signal_in & (~pre_in);
			pre_in <= signal_in;
		end
	end
endmodule
