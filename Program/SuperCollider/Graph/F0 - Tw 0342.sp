/* http://sccode.org/1-4Qy (F0) ; 0342 */
let b = [1 .. 8] / 128;
let c = LfSaw(b, 0) % 1;
let f = (2 ^ LfSaw(b, 0) * 256).round(64);
let e = Rlpf(LfSaw(1 / b / 32, 0), 500, 1.01 - c);
let o = SinOscFb(f, c) * e;
o.clip(0, 1).Splay / 2
