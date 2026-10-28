/* https://twitter.com/headcube/status/289761321065541633 (Nv) */
let i = inFeedback(99, 20);
let n = { lfNoise1(0.001) } ! 99 + 1 / 99;
let j = combL(lpf(i, 2000), 1, n, 0.05);
let d = { dust2(0.01) } ! 99;
let x = (j + d).sin;
splay2(x) <! out(20, (x - x.rotate(1)) / 2)
