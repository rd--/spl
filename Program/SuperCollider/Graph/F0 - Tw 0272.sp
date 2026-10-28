/* http://sccode.org/1-4Qy (F0) ; 0272 */
let b = [3 .. 8] * (sinOsc(0.05, 0).round(1) / 4 + 1);
let c = sinOsc(1.1 / b, 0);
let o = sinOsc(twoPole(sinOsc(2 ^ b, 0) > c, b * 99, c % 0.5 + 0.5), 0) / 2;
hpf(o.splay, 9)
