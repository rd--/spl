{- http://sccode.org/1-4Qy (F0) ; 0287 -}
let o = Saw((':>AEH.'.ascii.asList - (2 ^ LfSaw([1 .. 5] / 32, 0)).Ceiling).MidiCps);
let e = o % LfSaw([1 1 6], 0) % (LfSaw(2, [1 2] / 8) * 2);
Hpf(e.Splay, 9) / 2

{----- calculations -----}
':>AEH.'.ascii.asList = [58 62 65 69 72 46]
