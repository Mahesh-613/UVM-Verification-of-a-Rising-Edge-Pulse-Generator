class pulse_env extends uvm_env;
	`uvm_component_utils(pulse_env)
	pulse_agt agent;

	function new(string name="pulse_env",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent=pulse_agt::type_id::create("agent",this);
	endfunction

endclass
