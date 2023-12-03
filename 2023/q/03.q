// Utils:
load_input:{
        fn: "input/",(1_string 100+x),".txt";
        system"curl 'https://adventofcode.com/2023/day/",string[x],"/input' -H '",getenv[`AOC_SESSION],"' -o ",fn;
            :hsym `$fn
    };
/ load_input 1
read_input:{read0 `$":input/",1_string[100+x],".txt"};
read_test_input:{read0 `$":test/",1_string[100+x],".txt"};

//***********************
// Day 3
//***********************
/ test input (copy/paste inside ""):
inp:"\n" vs 
"467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
";

/ live input data:
load_input 3;
inp:read_input 3

/**** P1: 
/ work in 1 dim:
t:raze inp;

// got all numbers locations:
digits:t in .Q.n;
//ranges @0:
dlocs:enlist each flip(where 1_(>)prior 0,digits;where 1_(<)prior digits,0);
//expand ranges @1:
dlocs:dlocs,'{x:raze x;enlist x[0]+til 1+x[1]-x 0}each dlocs;
//parse numbers for the ranges @2:
dlocs:dlocs,'{get t @ x}each dlocs[;1];

// range around sym to look for numbers:
eps:raze (-1 1),(-1,1)*\:(count[first inp]+(-1,0,1));

// all syms locattions: (is `_ a sym???):
sym_locs:where t in except[;.Q.an,"."]distinct t;

//find all the numbers around symbol location:
f:{
    locs:x+eps;
    locs:locs where in[;.Q.n]t locs;
    raze dlocs[;2]distinct {where x within/: dlocs[;0]}each locs
  };
/x:first sym_locs

// and the ultimate answer is:
sum (raze/)f each sym_locs
/q)540025

//**** P2:gear is at *:
// look only around '*':
sym_locs:where t="*";

// use only where exactly 2 numbers present:
sum prd each r where 2=count each r:f each sym_locs
/q)84584891

