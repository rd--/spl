/* LocalBuf ; https://sccode.org/1-5fx */
let t = ({ (-0.08 -- 0.08).atRandom } ! 1024).LocalBuf;
let e = SinOsc(0.5 * LfNoise1(10) * 0.2 + 1, 0) * 0.1 + 1.05;
EqPan2(
	Rhpf(Lpf(Osc(t, 0.05, 0), 400), 500, 0.76),
	0
) * e

/* LocalBuf ; matrix form */
let buf = LocalBuf[48 60 69; 62 64 65];
let freq = BufRd(1, buf, MouseX(0, 3, 0, 0.2), 1, 1).MidiCps;
SinOsc(freq, 0) * 0.1
