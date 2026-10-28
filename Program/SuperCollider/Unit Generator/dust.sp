/* dust */
dust(2) * 0.25

/* dust ; decreasing density */
dust(xLine(20000, 2, 10)) * 0.15

/* dust ; list expansion */
(dust([4 14 40]) * [1 0.4 0.1]).splay2

/* dust ; multiple channels (24) */
{ dust(rand(4, 14)) * rand(0.1, 1) } ! 24
