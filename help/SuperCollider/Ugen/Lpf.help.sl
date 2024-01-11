{- Lpf ; https://scsynth.org/t/5208/7 ; at very low frequencies Lpf acts strangely -}
let impulseFreq = 3;
let lfo = LfPulse(impulseFreq, 0, 0.5);
let freq = LinExp(MouseX(0, 1, 0, 0.2), 0, 1, impulseFreq, 20000);
SinOsc(200 + (Lpf(lfo, freq) * 200), 0) * 0.1

{- Lpf -}
Lpf(WhiteNoise(), 500) * 0.1

{- Lpf ; modulate frequency -}
Lpf(WhiteNoise(), SinOsc([0.1, 0.13], pi) * [2300, 3000] + 3500) * 0.1

{- https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft -}
[
	Lpf(Saw(MouseX(50, 500, 0, 0.2)), MouseY(50, 1500, 1, 0.2)),
	Lpf(Saw(MouseX(60, 600, 0, 0.2)), MouseY(60, 1600, 1, 0.2)),
	Lpf(Saw(MouseX(75, 1700, 0, 0.2)), MouseY(70, 1700, 1, 0.2)),
	Lpf(Saw(MouseX(80, 800, 0, 0.2)), MouseY(80, 1800, 1, 0.2))
].Sum * 0.1

{- https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft -}
Lpf(
	Saw(MouseX([50 60 75 80], [500 600 1700 800], 0, 0.2)),
	MouseY([50 60 70 80], [1500 1600 1700 1800], 1, 0.2)
).Sum * 0.1
