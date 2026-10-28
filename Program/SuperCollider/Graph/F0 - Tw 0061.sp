/* http://fredrikolofsson.com/f0blog/more-sc-twitter/, F0 (0061) */
let t = saw([9, 9.01]);
let f = demand(t, 0, dseq(Infinity, [0, 0, 0, 0, 0, 0, 500]));
let p = sinOsc(lag(demand(t, 0, dshuf(Infinity, [0 .. 7] - 1 * 99)), 0.04), 0);
sinOsc(f, p) / 4
