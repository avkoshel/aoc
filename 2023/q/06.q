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
// Day 6
//***********************
/test inp:
inp:"\n" vs
"Time:      7  15   30
Distance:  9  40  200";

/live inp:
load_input 6;
inp:read_input 6;

/*** P1
t:get each last each":"vs/:inp;
prd{count where y<r:prd@'(x-i),'i:1+til x}'[t 0;t 1]
/1413720

/*** P2
t:"J"$except[;" "]each last each":"vs/:inp;
prd{count where y<r:prd@'(x-i),'i:1+til x}[t 0;t 1]
/30565288