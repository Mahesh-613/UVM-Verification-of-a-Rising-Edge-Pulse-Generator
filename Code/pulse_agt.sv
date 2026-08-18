class pulse_agt extends uvm_agent;
	`uvm_component_utils(pulse_agt)
	pulse_driver driver;
	pulse_monitor monitor;
	pulse_seqr seqr;

	function new(string name="pulse_agt",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		driver=pulse_driver::type_id::create("driver",this);
		monitor=pulse_monitor::type_id::create("monitor",this);
		seqr=pulse_seqr::type_id::create("seqr",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		driver.seq_item_port.connect(seqr.seq_item_export);
	endfunction
endclass
