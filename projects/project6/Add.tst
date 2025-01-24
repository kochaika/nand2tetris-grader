load Add.hdl,
compare-to Add.cmp,
output-list RAM16K[0]%D2.6.2;

ROM32K load Add.hack;

set reset 1,
tick, tock,
set reset 0;

repeat 20 {
  tick, tock;
}

output;
