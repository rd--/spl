{- DelayL -}
let osc = SinOsc(MouseX(110, 440, 1, 0.2), 0) * 0.1;
[osc, DelayL(osc, 4, MouseY(0.5, 4, 0, 2))]

{- DelayL ; stereo -}
let osc = SinOsc(MouseX(110, 440, 1, 0.2) * [1, 1.03], 0) * 0.1;
osc + DelayL(osc, 4, MouseY(0.5, 4, 0, 2))

{- DelayL ; audio input ; warning=feedback -}
let input = AudioIn([1, 2]);
let delayTime = [
	MouseX(0.5, 4, 0, 2),
	MouseY(0.5, 4, 0, 2)
] * LfNoise2(1 / [5, 7]).Abs;
input + DelayL(input, 4, delayTime)
