class pulse_monitor extends uvm_monitor;
	`uvm_component_utils(pulse_monitor)

	virtual pulse_if vif;
	uvm_analysis_port#(pulse_item)ap;

	function new(string name="pulse_monitor",uvm_component parent);
		super.new(name,parent);
		ap=new("ap",this);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual pulse_if)::get(this,"","vif",vif))
			`uvm_fatal("MON","Interface not found");
	endfunction

	task run_phase(uvm_phase phase);
		pulse_item item;
		forever begin
			@(posedge vif.clk);
			item=pulse_item::type_id::create("item");
			item.signal_in=vif.signal_in;

			item.pulse_out=vif.pulse_out;
			
			`uvm_info("MONITOR","Received transaction:",UVM_MEDIUM)
			item.print();
		end
	endtask
endclass
