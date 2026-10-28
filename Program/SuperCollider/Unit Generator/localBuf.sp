/* localBuf ; https://sccode.org/1-5fx */
let t = ({ (-0.08 -- 0.08).atRandom } ! 1024).localBuf;
let e = sinOsc(0.5 * lfNoise1(10) * 0.2 + 1, 0) * 0.1 + 1.05;
eqPan2(
	rhpf(lpf(osc(t, 0.05, 0), 400), 500, 0.76),
	0
) * e

/* localBuf ; matrix form */
let buf = [48 60 69; 62 64 65].localBuf;
let freq = bufRd(1, buf, mouseX(0, 3, 0, 0.2), 1, 1).midiCps;
sinOsc(freq, 0) * 0.1
