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

/inp: parse input data (TODO: how to do nested `each)
games:{{(!). flip{reverse(" JS";" ")0:x}each x}each x}each "," vs''";" vs'raze each flip(" *";":") 0: inp;

/P1:
mx:`red`green`blue!12 13 14;
sum 1+where not {any{any 0>mx-x}each x}each games

 /P2:
sum prd each {max each(,'/)x}each games


