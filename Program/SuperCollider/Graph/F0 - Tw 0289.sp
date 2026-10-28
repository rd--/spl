/* http://sccode.org/1-4Qy (F0) ; 0289 */
let b = [1 .. 50];
let t = impulse(b / 49, 0);
let o = sinOscFb(33 * b, lagUd(t, 0.005, 0.2) * 99) * lagUd(t, 0.007, 1);
gVerb(o.sum, 299, 9, 0.01, 0.5, 6, 1, 1, 1, 300) * 0.1
