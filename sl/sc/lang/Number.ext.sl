+ Number {

	AmpDb { :self |
		self.log10 * 20
	}

	coin { :self |
		randomFloat() < self
	}

	CpsMidi { :self |
		(log2 (self * (1 / 440)) * 12) + 69
	}

	DbAmp { :self |
		10 ** (self * 0.05)
	}

	degreeToKey { :scaleDegree :scale :stepsPerOctave |
		| k = scale.size, d = scaleDegree.rounded, a = (scaleDegree - d) * 10 * (stepsPerOctave / 12); |
		(stepsPerOctave * (d // k)) + scale[d % k + 1] + a
	}

	expRand { :self :upperBound |
		1.0.rand.linExpFromTo(self, upperBound)
	}

	linExpFromTo { :self :lo :hi |
		lo * ((hi / lo).log * self).exp
	}

	MidiCps { :self |
		440 * (2 ** ((self - 69) * (1 / 12)))
	}

}
