/* http://twitter.com/redFrik/status/1254441448327479299 */
let b = [1 3 5 8 10];
let e = [3, 2 / 3, 4, 3 / 2, 2];
let c = 0.021;
let d = lfTri(b / 999, 0) % 1;
let m = lfTri(b * c, 0);
let l = m * 7 + 20 + dseq(Infinity, b % (m * 5 + 6));
let j = duty(e / (12 ^ m), 0, l);
let f = localBuf(b).degreeToKey(j, 12).midiCps;
let i = decay2(impulse([2 / 3, 1.5, 3, 1.5, 3], 0), c, d);
let o = sinOscFb(f, lfTri(c / b, 0) + 1 / 3) * i * d;
freeVerb(splay2(o), 0.1, 1, 0.5)
