class pulse_sequence extends uvm_sequence#(pulse_item);
	`uvm_object_utils(pulse_sequence)

	function new(string name="pulse_sequence");
		super.new(name);
	endfunction

	task body();
		pulse_item req;
		repeat(10) begin
			req=pulse_item::type_id::create("req");
			start_item(req);
			assert(req.randomize());
			finish_item(req);
		end
	endtask
endclass
