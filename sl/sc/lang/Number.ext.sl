+ Number {

	degreeToKey { :scaleDegree :scale :stepsPerOctave |
		|
			k = scale.size,
			d = scaleDegree.rounded,
			a = (scaleDegree - d) * 10 * (stepsPerOctave / 12);
		|
		(stepsPerOctave * (d // k)) + scale[d % k + 1] + a
	}

}
