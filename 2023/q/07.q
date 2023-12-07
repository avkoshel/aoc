system"l q/utils.q"
`
/test:
inp:"\n" vs
"32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483";

inp:read_test_input1 5;

/live:
load_input 7;
inp:read_input1 7

// hands & their rankings:
ht:(enlist 5;4 1;3 2;3 1 1;2 2 1;2 1 1 1;1 1 1 1 1)

/********************
/* P1:
/********************
/parse input:
t:("*J";" ") 0: inp;

// remap cards values, so can use `desc:
m:"AKQJT98765432"!reverse[-5#.Q.A],"98765432"
t:t, enlist m@/:t[0];

//map each hand to a proper type:
r:(flip[t],'b) i:iasc b:{a:desc count each group x; ht ? value a }each t 0

//group by type and sort hands inside type:
r1:desc each r[;2 0 1] group r[;3]
// ingroup, so will have all hands sorted by type and strengs:
r2:raze value r1

// add relative rank:
r3:r2,'reverse 1+til count r2
// sum products of rank*bid:
sum prd flip r3[;2 3]

/*********************
/* P2:
/*********************
t:("*J";" ") 0: inp;
// same as in P1, but remap "J" to lowest value of "0":
m:"AKQT98765432J"!reverse[-4#.Q.A],"987654320"
t:t, enlist m@/:t[0]

// same as in P1, but add handling for "J". will increase largest card cound in a type by count of J:
r:(flip[t],'b) i:iasc b:{a:desc count each group x; a:"J"_@[a;"0"^first key[a] except "J";+;0^a"J"];   ht ? value a }each t 0  / x:t[0]3 

// rest is the same as in P1:
r1:desc each r[;2 0 1] group r[;3];
r2:raze value r1;
r3:r2,'reverse 1+til count r2;
sum prd flip r3[;2 3]
251910953
255632664

