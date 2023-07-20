/*Override the UVM_WARNING action to make quit_count equal to the number of times UVM_WARNING executes. 
Write an SV code to send four random messages to a terminal with potential error severity, Simulation must 
stop as soon as we reach to quit_count of four. Do not use UVM_INFO, UVM_ERROR, UVM_FATAL,*/

`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver) // registor class to a factory
 
  function new(string path, uvm_component parent);
    super.new(path, parent);
  endfunction
  
  task run();

    `uvm_warning("DRV", "Potential Error 1");
    `uvm_warning("DRV", "Potential Error 2");
    `uvm_warning("DRV", "Potential Error 3");
    `uvm_warning("DRV", "Potential Error 4");
    `uvm_warning("DRV", "Potential Error 5");

    
  endtask
  
endclass


module tb;

  driver d;
     
  initial begin
    d = new("DRV", null);
    d.set_report_severity_override(UVM_WARNING, UVM_ERROR);
    d.set_report_max_quit_count(4);
    d.run();
  end
endmodule