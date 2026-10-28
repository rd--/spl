/* https://sccode.org/1-4Qy ; F0 ; 0101 */
{ :currentTime :harmonicNumber |
	let nextHarmonicNumber = harmonicNumber % 8 + 1;
	let nextDelay = 9 - nextHarmonicNumber;
	let delayedOutput = delayN(inFb(2, 0), 1, 1);
	let oscillator = sinOsc(
		harmonicNumber * 99 + [0, 2],
		delayedOutput.reverse
	);
	release(
		oscillator / 9,
		0.02, nextDelay, 16
	).playAt(currentTime);
	[nextDelay, nextHarmonicNumber]
}.scheduleInjecting(2)
