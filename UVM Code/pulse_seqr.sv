class pulse_seqr extends uvm_sequencer#(pulse_item);
	`uvm_component_utils(pulse_seqr)

	function new(string name="pulse_seqr",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
