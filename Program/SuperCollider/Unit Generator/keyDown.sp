/* Event control ; Kyma keyboard names */
[1 .. 16].collect { :vc |
	sinOsc(keyPitch(vc).unitCps, 0) * keyDown(vc) * keyVelocity(vc)
}.splay2

/* Event control ; Kyma keyboard names */
[1 .. 16].collect { :vc |
	let freq = keyPitch(vc).unitCps + lfNoise2(0.25);
	let amp = asr(keyDown(vc), 0.1, 2, -4) * keyVelocity(vc); /* latch(keyVelocity(vc), keyDown(vc)) */
	lpf(saw(freq), keyTimbre(vc) + 0.1 * freq * 8) * amp
}.splay2
