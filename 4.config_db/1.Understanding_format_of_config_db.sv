// To share the resources with uvm config_db
// To share data between the components
`include "uvm_macros.svh"
import uvm_pkg::*;
	
class env extends uvm_env;
  `uvm_component_utils(env)
  
  int data;
  
  // constructor
  function new(string path = "env", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(uvm_config_db#(int):: get(null,"uvm_test_top","data",data))
      `uvm_info("ENV",$sformatf("Value of data : %0d", data), UVM_NONE)
    else
      `uvm_error("ENV", "Unable to access the Value");
  endfunction
  
endclass

class test extends uvm_test;
  `uvm_component_utils(test)
  
  env e;
  
  // constructor
  function new(string path = "test", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  // Build phase to update the value of data member in uvm_env class
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // this referes to class in which we are creating instance. Here ENV instance is added in TEST hence this will refer TEST
    // ENV will be child to the TEST class
    // Here TEST class will become the parent for ENV class
    e = env::type_id::create("e",this);
    
    uvm_config_db#(int)::set(null,"uvm_test_top","data",12); // arguments: context, instance name, key, value
  endfunction
  
  
endclass

module tb;
  initial begin
    run_test("test");
  end
endmodule