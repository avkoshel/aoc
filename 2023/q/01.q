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
// Day 1
//***********************
/ test input (copy/paste inside ""):
inp:"\n" vs 
"1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet";

/ live:
load_input 1;
inp:read_input 1;

/*** P.1:
q)sum {"I"$x (first;last)@\:where x in .Q.n}each inp

/*** P2:
/test:
/
inp:"\n" vs "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"
\

/quick solution:
dd:flip(("one";"two";"three";"four";"five";"six";"seven";"eight";"nine");("1e";"2o";"3e";"4";"5e";"6";"7n";"8t";"9n"));
f:{ x{ssr[x;y 0;y 1]}/dd };
sum {"J"$x (first;last)@\:where x in 1_.Q.n}each {{f x,y}/[x]}each inp 
