// This is a test file for the NOT gate

//Load Not.hdl file, create output file, compare it to Not.cmp, create the list format for the output file.

load Not.hdl,
output-file Not.out,
compare-to Not.cmp,
output-list in%B3.1.3 out%B3.1.3;

//Set input values, run simulation (eval) and give output.

set in 0,
eval,
output;

set in 1,
eval,
output;
