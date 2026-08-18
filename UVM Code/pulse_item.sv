class pulse_item extends uvm_sequence_item;
	rand bit signal_in;

	bit pulse_out;

	`uvm_object_utils_begin(pulse_item)

	`uvm_field_int(signal_in,UVM_ALL_ON)
	`uvm_field_int(pulse_out,UVM_ALL_ON)
	
	`uvm_object_utils_end

	function new(string name="pulse_item");
		super.new(name);
	endfunction
endclass

