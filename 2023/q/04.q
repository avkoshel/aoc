/test inp:
inp:"\n" vs "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11";

/load_input 4;
inp:read0 `:input/04.txt;

t:{get each "|" vs last":" vs x}each inp;

// P.1:
sum 2 xexp'-1+except[;0]sum each (in)./:  t
/23441f


// P2:
/ number of wins and cards per card #:
x:(sum each(in)./:t),'1;

/ expand #cards as per #wins:
x:{.[x;(1+y+til x[y;0];1);+;x[y;1]]}/[x;til count x]

/ number of cards per card number is in col 1:
sum x[;1]
/ 5923918