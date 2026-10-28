/* http://sccode.org/1-5d6 (jpd) ; requires=SfAcquire */
let sampleRate = 48000;
let sndBuf = sfAcquireMono('Floating');
let envBuf = [-1 1].resample(sampleRate).collect { :x |
	(1 - (x ^ 2)) ^ 1.25
}.localBuf;
let pan = 0;
let stretch = 50;
let window = 0.25;
let amp = 1;
let fftSize = 2 ^ (window * sampleRate).log2.floor;
let trigPeriod = fftSize / sampleRate;
let trig = impulse(1 / trigPeriod, 0);
let bufDur = bufDur(sndBuf);
let pos1 = demand(trig, 0, dseries(Infinity, 0, trigPeriod / (stretch * bufDur)));
let pos2 = pos1 + (trigPeriod / (2 * stretch * bufDur));
let grains = grainBuf(
	1,
	trig,
	trigPeriod,
	sndBuf,
	1,
	[pos1, pos2],
	2,
	0,
	-1 /* EnvBuf */,
	512
) * amp;
let diffused = grains.collect { :item |
	let c1 = fft(bufAlloc(1, fftSize), item, 1, -1, 1, 0);
	let c2 = pvDiffuser(c1, 1 - trig);
	ifft(c2, -1, 0)
};
let enveloped = diffused * playBuf(1, envBuf, 1 / trigPeriod, 1, 0, 1, 0);
let delayed = delayC(enveloped.second, trigPeriod / 2, trigPeriod / 2);
pan2(enveloped.first + delayed, pan, 1)

/* Notes:

`grainBuf` will not read envelope from `localBuf` (use default)
*/
