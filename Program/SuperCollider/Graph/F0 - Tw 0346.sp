/* http://sccode.org/1-4Qy (F0) ; 0346 */
let c = sinOscFb(1 - sinOscFb(1 / [3, 2], 0).round(0.5) + inFb(2, 0), 0);
(sinOscFb(2 ^ sinOscFb(1 - c, 0).round(1 - c) * 400, c.abs) * lag(c, 0.1) * c).tanh
