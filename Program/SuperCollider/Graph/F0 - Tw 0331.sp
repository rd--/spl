/* http://sccode.org/1-4Qy (F0) ; 0331 ; requires=demand */
let b = [3 3 2 2 2 1 2 2 2] / 3;
let c = spring(tDuty(dseq(Infinity, b), 0, 1) / 9, 1, 0);
ringz(c, 50 * duty(c + 1 / [6 3], 0, dseq(Infinity, lag(c, 0.1) > 0 + [2 4] / b)), 1)
