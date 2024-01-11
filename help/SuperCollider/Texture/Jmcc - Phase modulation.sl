{- Phase modulation with slow beats (Jmcc) #6 -}
{
	let x = MouseX(100, 6000, 1, 0.2); {- random frequency of new events -}
	let y = MouseY(0, 2, 0, 0.2); {- modulation index -}
	let f1 = x.Rand0;
	let ph = 0;
	3.timesRepeat {
		let f2 = x.Rand0;
		ph := SinOsc([f2, f2 + 1.Rand2], 0) * y + ph
	};
	SinOsc([f1, f1 + 1.Rand2], ph) * 0.1
}.overlap(4, 4, 4)
