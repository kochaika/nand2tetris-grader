// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/mult/Mult.tst

// nand2tetris run $(pwd)/hw4/Mult.tst

load Max.hdl,
compare-to Max.cmp,
output-list RAM16K[0]%D2.6.2 RAM16K[1]%D2.6.2 RAM16K[2]%D2.6.2;

ROM32K load Max.hack;

set reset 1,
tick, tock,
set reset 0;

set RAM16K[0] 3,   // Set test arguments
set RAM16K[1] 5,
set RAM16K[2] -1;  // Ensure that program initialized product to 0
repeat 50 {
  tick, tock;
}
set RAM16K[0] 3,   // Restore arguments in case program used them as loop counter
set RAM16K[1] 5,
output;

set reset 1,
tick, tock,
set reset 0;

set RAM16K[0] 23456,   // Set test arguments
set RAM16K[1] 12345,
set RAM16K[2] -1;  // Ensure that program initialized product to 0
repeat 80 {
  tick, tock;
}
set RAM16K[0] 23456,   // Restore arguments in case program used them as loop counter
set RAM16K[1] 12345,
output;
