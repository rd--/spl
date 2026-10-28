/* F0 ; http://twitter.com/redFrik/status/1105496695637454848 */
let b = [1 .. 15] + 1 / 151;
let w = (varSaw(b, b, 1 / 5.15) * 1 + 1.5).ceiling;
let i = (varSaw(1 / 15, 1 / 5, b) * 5).ceiling + 5 / 5;
let s = bufRd(1, [51 * 1.5, 51, 151].localBuf, i, 0, 1);
let x = lag(s, b);
let y = varSaw(5 + b, 0, 0.5);
let z = varSaw(b, b, b) * b / 5 + [1.5, 5, 1];
let m = varSaw(5 - b, b, b) * 5 + 5;
let o = varSaw(w * x + y * z, b, varSaw(b, 0, 0.5) + 5 / 15) * (m > 1.515);
let f = 1515 ^ (varSaw(1 - b / 5, 0, 0.5) / 15 + 1 + b);
let rq = 1.5 ^ varSaw(b, 0, 0.5) / 5;
bLowPass(o, f, rq).splay / 5
