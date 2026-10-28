/* http://sccode.org/1-4Qy (F0) ; 0342 */
let b = [1 .. 8] / 128;
let c = lfSaw(b, 0) % 1;
let f = (2 ^ lfSaw(b, 0) * 256).round(64);
let e = rlpf(lfSaw(1 / b / 32, 0), 500, 1.01 - c);
let o = sinOscFb(f, c) * e;
o.clip(0, 1).splay / 2
