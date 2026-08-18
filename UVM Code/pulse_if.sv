interface pulse_if(input logic clk);
	logic rst;
	logic signal_in;
	logic pulse_out;

clocking drv_cb @ (posedge clk);
	default input #1step output #1step;
	output rst;
        output signal_in;
	
	input pulse_out;
endclocking

clocking mon_cb @ (posedge clk);
	default input #1step;
	input rst;
        input signal_in;
	input pulse_out; 
endclocking

modport DRIVER(clocking drv_cb,input clk);
modport MONITOR(clocking mon_cb,input clk);

endinterface

