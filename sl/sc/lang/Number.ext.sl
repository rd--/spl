+ Number {

	degreeToKey { :scaleDegree :scale :stepsPerOctave |
		|
			k = scale.size,
			d = scaleDegree.rounded,
			a = (scaleDegree - d) * 10 * (stepsPerOctave / 12);
		|
		(stepsPerOctave * (d // k)) + scale[d % k + 1] + a
	}

	SoftClip { :self |
		if(self.abs <= 0.5) {
			self
		} {
			(self.abs - 0.25) / self
		}
	}

}
