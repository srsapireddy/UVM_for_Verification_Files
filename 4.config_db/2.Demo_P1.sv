// uvm_config_db is used to share the virtual interface to transfer data between the classes
// uvm_config_db #(int) :: set(context [null: static, dynamic: this, instance_name, key [name of the variable], value])
// all the classes are the dynamic components, we can add null and this as the arguments for dynamic class
// :: -> to get the access of get and set method
// which ever the class have the key "uvm_test_top.data" can access the data = 256. we can access the data as we have a match on the data container.
// we are sending this data to the console in the run phase.

module tb;
 
  int data = 256;
 
  initial begin
    // set -> to share the data with the other classes
    // get -> to access the data from other classes
    uvm_config_db #(int)::set(null, "uvm_test_top", "data", data); // uvm_test_top.data
    
    
    
  end