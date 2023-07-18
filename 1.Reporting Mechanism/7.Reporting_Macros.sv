`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver) // registor class to a factory
 
  function new(string path, uvm_component parent);
    super.new(path, parent);
  endfunction
  
  task run();
    `uvm_info("DRV", "Informational Message", UVM_NONE); // reporting macros
    `uvm_warning("DRV", "Potential Error");
    `uvm_error("DRV", "Real Error");
    #10;
    `uvm_fatal("DRV", "Simulation cannot continue");
    
  endtask
  
endclass


module tb;

  driver d;
     
  initial begin
    d = new("DRV", null);
    d.run();
  end
endmodule