/* grainBuf ; requires=keywords */
let sndBuf = sfAcquireMono('Floating');
let envBuf = -1;
let pan = mouseX(-1, 1, 0, 0.2);
grainBuf(
	numChan: 2,
	trigger: impulse(10, 0),
	dur: 0.1,
	sndBuf: sndBuf,
	rate: lfNoise1(500).linLin(-1, 1, 0.5, 2),
	pos: lfNoise2(0.1).linLin(-1, 1, 0, 1),
	interp: 2,
	pan: pan,
	envBufNum: envBuf,
	maxGrains: 512
)
