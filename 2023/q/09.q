system"l q/utils.q"

/test:
/inp:"\n\n" vs
inp:"\n" vs "0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45";

reverse inp:read_test_input 9;

/live:
load_input 9;
inp:get each -1 _"\n" vs read_input1 9
t:inp
/********************
/* P1:
/********************
f1:{
    r:reverse{1_deltas x}\[{not all 0=x};x];
    last last {0N!(x;y);y,last[x]+last y}\[r 0;r]
 };

sum{f1 x}@/: t
/!!! test: 114
/!!! live:2075724761

/************** P2
f2:{
    x:reverse{0N!x;1_deltas x}\[{not all 0=x};x];
    r:{(first[y]-first x),y}\[x 0;x]
 }
 
 /!!!!!!!!!!!!!!!!!!!!!
sum {first last f2 x}each t
/test: 2!!!
/live: 1072!!!
