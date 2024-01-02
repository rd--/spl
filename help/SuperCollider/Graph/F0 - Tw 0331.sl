(* https://sccode.org/1-4Qy ; f0 ; 0331 *)
var b = [3 3 2 2 2 1 2 2 2] / 3;
var c = Spring(TDurationSequencer(b, 1) / 9, 1, 0);
Ringz(c, 50 * HoldSequence(Lag(c, 0.1) > 0 + [2 4] / b, c + 1 / [6 3]), 1)

(* https://sccode.org/1-4Qy ; f0 ; 0331 ; requires=demand *)
var b = [3 3 2 2 2 1 2 2 2] / 3;
var c = Spring(TDuty(Dseq(inf, b), 0, 1) / 9, 1, 0);
Ringz(c, 50 * DurationSequencer(Lag(c, 0.1) > 0 + [2 4] / b, c + 1 / [6 3]), 1)
