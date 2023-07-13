`include "uvm_macros.svh" //`uvm_info - include all the macros
import uvm_pkg::*; // include definition of all the classes

module tb;
  initial begin
    #50;
    `uvm_info("TB_TOP", "Hello World", UVM_LOW);
    $display("Hello World with Display");
  end
endmodule