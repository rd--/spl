/* Atan2 */
let x = 10;
let y = LfSaw(1 / 6, 0) * 100;
let distance = Hypot(x, y);
let amplitude = 40 / distance.Squared;
let sound = Rlpf(SinOsc(200, 0) * LfPulse(31.3, 0, 0.4), 400, 0.3);
let azimuth = Atan2(y, x);
let loc = Clip2(azimuth / 1/2.pi, 1);
EqPan2(
	DelayL(sound, 110 / 344, distance / 344),
	loc
) * amplitude
