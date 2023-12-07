// Utils:
load_input:{
        fn: "input/",(1_string 100+x),".txt";
        system"curl 'https://adventofcode.com/2023/day/",string[x],"/input' -H '",getenv[`AOC_SESSION],"' -o ",fn;
            :hsym `$fn
    };

/ load_input 1
.i.read:{[f;d;x] f@` sv hsym[d],` sv (`$1_string 100+x),`txt};

read_input:.i.read[read0;`:input];
read_input1:("c"$.i.read[read1;`input;] ::);

read_test_input:.i.read[read0;`:test];
read_test_input1:("c"$ .i.read[read1;`:test;] ::);


depth:{$[type[x]<0; 
  0; 
  "j"$sum(and)scan 1b,-1_{1=count distinct count each x}each raze scan x]
  }

shape:{$[0=d:depth x; 
  0#0j; 
  d#{first raze over x}each(d{each[x;]}\count)@\:x]
  }

tc:til count@
tt:{2 vs til "j"$2 xexp x}              / truth table of order x
zm:{(2#count x)#0}                      / zero matrix (square matrix)