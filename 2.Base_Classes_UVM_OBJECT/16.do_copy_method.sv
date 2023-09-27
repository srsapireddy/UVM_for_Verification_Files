`include "uvm_macros.svh"
import uvm_pkg::*;

// defining the class object. since we plan to use out own implementation for the core method that we have in an uvm we will be registring a class to an uvm factory.
class obj extends uvm_object;
	`uvm_object_utils(obj)
	
	// constructor
	function new(string path = "obj");
		super.new(path);
	endfunction
	
	// data members
	rand bit [3:0] a;
	rand bit [4:0] b;
	
	// adding an implementation for a print method
	virtual function void do_print(uvm_printer printer);
		super.do_print(printer);
		printer.print_field_int("a :",a, $bits(a), UVM_DEC);
		printer.print_field_int("b :",b, $bits(b), UVM_DEC);
	endfunction
	
	virtual function void do_copy(uvm_object rhs); // this should match with the template in svh file
		obj temp;
		$cast(temp, rhs); // it makes sure that the temp and rhs both are of same type. We also get an handle of an rhs. Now temp will now have access to the data of rhs. 
		super.do_copy(rhs);
		// updating the data member of a class with the value of data members of an object which is added by the user as an argument to the copy function
			this.a = temp.a;
			this.b = temp.b;
	endfunction
	
endclass

module tb;
	obj o1,o2; // create 2 instances of an object
	
	initial begin
	// use create method ot create an object
		o1 = obj::type_id::create("o1");
		o2 = obj::type_id::create("o2");
		
		o1.randomize();
		o1.print();
		o2.copy(o1);
		o2.print();
	end
endmodule