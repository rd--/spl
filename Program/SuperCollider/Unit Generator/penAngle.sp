/* penAngle ; range is (0, 1) ; boundary sine tones give reference points */
let referenceTones = sinOsc([220, 440], 0) * 0.025;
[1 .. 16].collect { :vc |
	sinOsc(penAngle(vc) * 220 + 220, 0) * penDown(vc) * 0.1
}.splay2 + referenceTones

/* penAngle ; as pan control */
[1 .. 16].collect { :vc |
	eqPan2(
		blip(penX(vc) * 220 + 220, penY(vc) * 4 + 1),
		penAngle(vc) * 2 - 1
	) * penZ(vc) * penDown(vc)
}.mix
