// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/mult/Mult.tst

// nand2tetris run $(pwd)/hw4/Mult.tst

load Rect.hdl,
compare-to Rect.cmp,
output-list time%S1.3.1 ARegister[]%D1.7.1 DRegister[]%D1.7.1 PC[]%D0.4.0 RAM16K[0]%D1.7.1 RAM16K[1]%D1.7.1 RAM16K[2]%D1.7.1;

ROM32K load Rect.hack;

set reset 1,
set reset 0;
set RAM16K[0] 4;

repeat 63 {
  tick, tock, output;
}
