`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver) // registor class to a factory
 
  function new(string path, uvm_component parent);
    super.new(path, parent);
  endfunction
  
  task run();
    `uvm_info("DRV1", "Executed Driver1 Code", UVM_HIGH); // reporting macros
    `uvm_info("DRV2", "Executed Driver1 Code", UVM_HIGH);
  endtask
  
endclass

class env extends uvm_env;
  `uvm_component_utils(env);
  
  function new(string path, uvm_component parent);
    super.new(path, parent);
  endfunction
  
  task run();
    `uvm_info("ENV1", "Executed Env1 Code", UVM_HIGH);
    `uvm_info("ENV2", "Executed Env2 Code", UVM_HIGH);
  endtask
endclass

module tb;
  driver drv;
  env e;
     
  initial begin
    drv = new("DRV", null);
    e = new("ENV", null);
    // drv.set_report_id_verbosity("DRV2", UVM_HIGH);
    // e.set_report_verbosity_level(UVM_HIGH);
    drv.run();
    e.run();
  end
endmodule

// Run Options: +access+r +UVM_VERBOSITY=UVM_HIGH