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
    `uvm_error("DRV", "Real Error"); // default action: uvm_count
    `uvm_error("DRV", "Second Real Error");
    /*
    #10;
    `uvm_fatal("DRV", "Simulation cannot continue DRV"); // default action: uvm_exit
    #10;
    `uvm_fatal("DRV1", "Simulation Cannot Continue DRV1");
    */
  endtask
  
endclass


module tb;

  driver d;
     
  initial begin
    d = new("DRV", null);
    d.set_report_max_quit_count(3);
    d.run();
  end
endmodule