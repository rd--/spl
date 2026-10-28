/* https://gist.github.com/nhthn/8f0dcc1c85e662fe5bf7d0132155c0af (nh) */
let freqScale = mouseY(0.01, 3, 1, 0.2);
let snd = localIn(4, 0);
let freq = 3000 * freqScale + ((lpf(snd, 0.1) * 100) * [1000, 1500, 1200, 1100]);
snd := rlpf(saw(lpf(freq.abs, 1) * snd), 1000 * freqScale + (900 * snd), snd.abs + 0.01);
snd := selectT(
	pulseDivider(bpf(snd, 0.1, 0.1), 1000, 0),
	[
		snd,
		rlpf(snd, 1000 * freqScale + (100 * lpf(snd, 0.1).fold(-1, 1)), 0.5).tanh
	]
);
snd := leakDc(sanitize(snd, 0).clip, 0.995);
snd := [2, 3, 4, 1].collect { :index | snd[index] };
snd := snd <! localOut(snd.clip);
snd := splay2(snd, 0.5, 1, 0, true);
snd.clip * -12.dbAmp
