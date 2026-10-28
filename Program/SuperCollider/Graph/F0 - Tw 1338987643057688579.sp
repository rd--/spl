/* F0 <http://twitter.com/redFrik/status/1338987643057688579> */
let b = [8 .. 18];
let x = varSaw([18.1, 81.8, 1.81] + b, 1, varSaw(b / 81, 0, 0.5));
let t = varSaw(8 / 1.818, [1, 8 / 18], 0.5);
let d = varSaw(b / 181.8, 0, 0.5).expRange(1.81 / 818, 1.8 / 181.8).round(1.81 / 818);
let c = varSaw(1 / 8, 1 / b, 0.5) + 8.18 * 1.8;
let z = varSaw(1 / 81.8, 0, 0.5).linLin(-1, 1, 1.8 ^ -1, 8.1 / 8.18);
let p = pluck(x, t, 1.8 / 181.8, d, c, z) * varSaw(1.8 / b, 0, 0.5)  /  1.8;
hpf(splay(p), 18 / 1.81)
