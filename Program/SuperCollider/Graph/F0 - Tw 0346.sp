/* http://sccode.org/1-4Qy (F0) ; 0346 */
let c = SinOscFb(1 - SinOscFb(1 / [3, 2], 0).round(0.5) + InFb(2, 0), 0);
(SinOscFb(2 ^ SinOscFb(1 - c, 0).round(1 - c) * 400, c.abs) * Lag(c, 0.1) * c).tanh
