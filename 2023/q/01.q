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

/or better one by https://github.com/AngusWilson/Advent23/commits?author=AngusWilson using `except:
q)sum {"I"$(first;last)@\:x except .Q.a}each inp


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

/quick solution using ssr[] with extra chars to conver overlaps like "oneight"->18 or "twone"->21:
dd:flip(("one";"two";"three";"four";"five";"six";"seven";"eight";"nine");("1e";"2o";"3e";"4";"5e";"6";"7n";"8t";"9n"));
f:{ x{ssr[x;y 0;y 1]}/dd };
sum {"J"$x (first;last)@\:where x in 1_.Q.n}each {{f x,y}/[x]}each inp 


// P2 using ss:
dd:(("one";"two";"three";"four";"five";"six";"seven";"eight";"nine");("1";"2";"3";"4";"5";"6";"7";"8";"9"));
sum{
    x3:(,'/){(1_.Q.n)!ss[x;]each y}[x]each dd;
    "J"$(first;last)@\:key asc(raze(count each v)#'key x3)!raze v:value x3
}each inp

//P2: Like that one better:
// inspired by community commits: uses `ss[] and expanded lookup dictionary (AW), that includes both words and numbers
q)
dd:("one";"two";"three";"four";"five";"six";"seven";"eight";"nine"),enlist each 1_.Q.n;
f:{[dd;x] (first key ::) each (asc;desc)@' (min';max')@\:{(18#1 _.Q.n)!ss[x]each y}[x;dd]}[dd];
sum "J"$f each inp
53268
q)
