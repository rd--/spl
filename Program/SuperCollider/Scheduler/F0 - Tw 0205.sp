/* https://sccode.org/1-4Qy ; F0 ; 0205 */
{ :currentTime :frequencies |
	let oscillators = SinOsc(Duty(1 / [8 9], 0, Dseq(99, frequencies)), 0);
	Release(oscillators * 0.1, 0, 0, 9).playAt(currentTime);
	(frequencies * 9).wrapExclusive(99, 8000)
}.recurseEvery([1 3 5 7 9] * 99, 2)
