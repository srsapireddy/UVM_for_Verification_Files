`include "uvm_macros.svh"
import uvm_pkg::*;

// Building Child Component
class a extends uvm_component;
  `uvm_component_utils(a)
  
  function new(string path = "a", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("a", "Class a executed", UVM_NONE);
  endfunction
endclass

class b extends uvm_component;
  `uvm_component_utils(b)
  
  function new(string path = "b", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("b", "Class b executed", UVM_NONE);
  endfunction
endclass

// Creating Parent Class
class c extends uvm_component;
  `uvm_component_utils(c)
  
  a a_inst;
  b b_inst;
  
  function new(string path = "c", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a_inst = a::type_id::create("a_inst", this);
    b_inst = b::type_id::create("b_inst", this);
    // Manually calling build phase. Don't use this method
    a_inst.build_phase(null);
    b_inst.build_phase(null);
  endfunction
  
  // To view hierarchy
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology(); // To print hierarchy
  endfunction
endclass

module tb;
  /*
  initial begin
    run_test("c");
  end
  */
  c c_inst;
  
  initial begin
    c_inst = c::type_id::create("c_inst", null);
    c_inst.build_phase(null);
  end
endmodule










