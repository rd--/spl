+ Number {

	degreeToKey { :scaleDegree :scale :stepsPerOctave |
		|
			k = scale.size,
			d = scaleDegree.rounded,
			a = (scaleDegree - d) * 10 * (stepsPerOctave / 12);
		|
		(stepsPerOctave * (d // k)) + scale[d % k + 1] + a
	}

	geom { :self :start :grow |
		| accum = start; |
		1.to(self).collect { :unusedItem |
			| entry = accum; |
			accum := grow * accum;
			entry
		}
	}

	series { :self :start :step |
		1.to(self).collect { :item |
			(step * (item - 1)) + start
		}
	}

	SoftClip { :self |
		(self.abs <= 0.5).if {
			self
		} {
			(self.abs - 0.25) / self
		}
	}

}
