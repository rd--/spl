/* http://gist.github.com/nhthn/8f0dcc1c85e662fe5bf7d0132155c0af (nh) */
let index = mouseY(1, 7000, 1, 0.2);
let freq = mouseX(0.01, 40, 1, 0.2);
let divide = 1;
let cutoff = 1;
let snd = localIn(4, 0);
snd := latch(snd, pulseDivider(snd.reverse, lpf(snd, 10 * cutoff) * 100000 * divide, 0));
snd := sinOsc({ expRand(10, 100) } ! 4 * freq + (snd * index), 0);
snd := latch(snd, pulseDivider(snd.reverse, lpf(snd, 10 * cutoff).cube * 8000 * divide, 0));
snd := lpf(snd, 440);
snd := selectT(
	lpf(snd.reverse, 10 * cutoff) * 3,
	[
		pulse(440 * freq + (snd * index), 0.5),
		sinOsc(100 * freq + (snd * index), 0)
	]
);
snd := rlpf(snd, 440 + (1000 * lpf(lpf(snd, 1), 1).clip), 0.1);
snd := sanitize(snd, 0);
4.timesRepeat {
	snd := snd + sinOsc(expRand(10, 800) * freq + lpf(snd * index, 100), 0)
};
snd := snd <! localOut(snd);
snd := snd.splay;
snd.clip(-1, 1) * -12.dbAmp
