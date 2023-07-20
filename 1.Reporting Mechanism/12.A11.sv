/*Send the name of the first RTL that you designed in Verilog with the help of reporting Macro. Do not override the default verbosity. 
Expected Output : "First RTL : Your_System_Name"*/

`include "uvm_macros.svh" //`uvm_info - include all the macros
import uvm_pkg::*; // include definition of all the classes

module tb;
  initial begin
    #50;
    `uvm_info("TB_TOP", "First RTL : Your_System_Name", UVM_LOW);
    $display("Hello World with Display");
  end
endmodule