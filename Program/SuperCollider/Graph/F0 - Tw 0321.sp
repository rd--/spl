/* http://sccode.org/1-4Qy (F0) ; 0321 */
let b = [1 .. 6] * 60;
let c = sinOsc(b, localIn(6, 0) * 3);
let d = bpf(c, sinOsc(16 / b, 0) + 3 * b, 1);
let w = localOut(limiter(d, 0.66, 16 / b));
c.splay / 2 <! w
