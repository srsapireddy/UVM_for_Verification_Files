`include "uvm_macros.svh"
import uvm_pkg::*;
 
class comp extends uvm_component; // creating a class
  `uvm_component_utils(comp) // registering class to uvm component
  
  function new(string path = "comp", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  // when we consider a uvm component we need to work on phases. entire simulation is divided into phases
  // build phase is executed prior to execution time - useful to create an instance of an object
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase); // add this if skeleton has function
    `uvm_info("COMP", "Build phase of comp executed", UVM_NONE);  // message sent ba a component
  endfunction
  
endclass
 
module tb;
  
  comp c;
  
  initial begin
    c = comp::type_id::create("c", null);
    c.build_phase(null);
  end
  /*
  initial begin
    run_test("comp");
  end
  */
endmodule