/* http://sccode.org/1-4Qy (F0) ; 0329 */
let e = sinOsc(97 / lag((sinOsc(1 / 32, 0) + 2.2).round(1), 0.1), 0).pi;
let c = sinOsc(99, localIn(9, 0) * sinOsc([1 .. 9] / 99 - 98, 0) * e);
c.splay / 9 <! localOut(c)
