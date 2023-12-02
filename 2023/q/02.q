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
// Day 2
//***********************
/ test input (copy/paste inside ""):
inp:"\n" vs 
"Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green";

/ live input data:
load_input 2;
inp:read_input 2

/ inp: parse input data (TODO: how to do nested `each)
games:{{(!). flip{reverse(" JS";" ")0:x}each x}each x}each "," vs''";" vs'raze each flip(" *";":") 0: inp;
/ inp: better one, using modified rak1507 parsing to keep individual draws, just for variety, 
/     othervise use excellent rak1507 parer instead: https://github.com/rak1507/aoc-2023/blob/main/2.q
games:{{{(first get each) each group first each (!). flip 0N 2#" "vs 1_x}x}each ";" vs first 1_":" vs x}each inp;

/P1:
mx:"rgb"!12 13 14;
sum 1+where not {any{any 0>mx-x}each x}each games
/1734

 /P2:
sum prd each {max each(,'/)x}each games
/70387
