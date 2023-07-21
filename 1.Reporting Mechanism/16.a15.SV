/*Exit Simulation with UVM_WARNING*/
/*
Add the code in the template mentioned below to achieve the following objectives:

1. Include four independent warning messages in the run task of component a.

2. The warning ID must be "a" and the messages must be "Warning 1" , "Warning 2" and so on.

3. Warning messages should be sent one after another starting from Warning 1 to Warning 4 at an interval of 10 ns i.e. Warning 1 at 0 ns, Warning 2 at 10 ns and so on.

4. Override the UVM_WARNING action so that it is included in the UVM quit count.

5. Set the quit count threshold at 4.
*/

/*Write a TB_TOP Code to send message with ID : CMP1 to console while blocking message with ID : CMP2. 
Code is mentioned in the Instruction tab. Do not change Component code.*/

`include "uvm_macros.svh"
import uvm_pkg::*;
     
//////////////////////////////////////////////////
class component extends uvm_component;
`uvm_component_utils(component)
      
  function new(string path , uvm_component parent);
	super.new(path, parent);
  endfunction
     
      
  task run();
    `uvm_warning("a", "Warning 1");
     #10
    `uvm_warning("a", "Warning 2");
    #10
    `uvm_warning("a", "Warning 3");
    #10
    `uvm_warning("a", "Warning 4");
  endtask
      
endclass

module tb;
  
  component c;
  
  initial begin
    c = new("a", null);
    c.set_report_severity_override(UVM_WARNING, UVM_ERROR);
    c.set_report_max_quit_count(4);
    c.run();
  end
endmodule

