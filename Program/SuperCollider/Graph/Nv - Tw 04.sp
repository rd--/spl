/* Nv ; http://swiki.hfbk-hamburg.de/MusicTechnology/899 ; wait */
let s = localIn(2, 0) * 7.5 + (saw([32, 33]) * 0.2);
let f = 2 ^ (lfNoise0(4 / 3) * 4) * 300;
let a = combN(bpf(s, f, 0.1).distort, 2, 2, 40);
a <! localOut(a)
