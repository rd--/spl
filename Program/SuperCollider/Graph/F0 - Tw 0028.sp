/* Tw 0028 (F0) ; http://www.fredrikolofsson.com/f0blog/?q=node/537 ; wait */
let p = dseq(Infinity, dshuf(8, [1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987] % 8 * 99));
let q = combN(demand(impulse(8, 0), 0, p), 4, 4, 16);
let o = lfTri(q, 0) / 4;
let f = lfTri(1 / 16, 0) * 2000 + 3000;
[moogFf(o, f, 2, 0)] # 2
