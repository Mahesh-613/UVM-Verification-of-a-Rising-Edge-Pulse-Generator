import uvm_pkg::*;
`include "uvm_macros.svh"
`include "project.sv"
`include "pulse_if.sv"
`include "pulse_item.sv"
`include "pulse_sequence.sv"
`include "pulse_seqr.sv"
`include "pulse_driver.sv"
`include "pulse_monitor.sv"
`include "pulse_agt.sv"
`include "pulse_env.sv"
`include "pulse_test.sv"
module pulse_top;
logic clk;

initial begin
	clk=0;
	forever #5 clk=~clk;
end

pulse_if intf(clk);

project dut(.clk(intf.clk),
	       .rst(intf.rst),
	       .signal_in(intf.signal_in),
	       .pulse_out(intf.pulse_out));
initial begin
    intf.rst = 1;
    #12;
    intf.rst = 0;
    #12;
    intf.rst = 1;
    #10;
    intf.rst = 0;
end
       initial begin
	       uvm_config_db#(virtual pulse_if)::set(null,"*","vif",intf);
 	       run_test("pulse_test");
       end

       initial begin
	       $fsdbDumpfile("pulse_dump.fsdb");
	       $fsdbDumpvars(0,pulse_top);	
	end
endmodule
