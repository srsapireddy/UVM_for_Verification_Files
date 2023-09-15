`include "uvm_macros.svh"
import uvm_pkg::*;

// old transaction class
class first extends uvm_object;
  rand bit [3:0] data;
  
  function new(string path = "first");
    super.new(path);
  endfunction

  // using field macro
  `uvm_object_utils_begin(first)
  `uvm_field_int(data, UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass

//////////////////////////////////////////
class first_mod extends first;
  rand bit ack;
  
  function new(string path = "first_mod");
    super.new(path);
  endfunction
  
  `uvm_object_utils_begin(first_mod)
  `uvm_field_int(ack, UVM_DEFAULT);
  `uvm_object_utils_end
endclass

class comp extends uvm_component;
  `uvm_component_utils(comp)
  
  first f;
  
  // adding a constructor to a component to create an object of transaction class first
  function new(string path = "second", uvm_component parent = null);
    super.new(path, parent);
    f = first::type_id::create("f");
    f.randomize();
    f.print();
  endfunction
endclass

module tb;
  comp c; // create an instance of a component
  
  initial begin
    // using factory override method
    c.set_type_override_by_type(first::get_type, first_mod::get_type);
    c = comp::type_id::create("c", null); // use create method to create an object of an component
  end
endmodule

// if we try to execute the method with new method we cannot override the factory and we cannot see ack signal while creating a class