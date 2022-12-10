+ Ugen {


}

+ Number {

	degreeToKey { :scaleDegree :scale :stepsPerOctave |
		| k = scale.size, d = scaleDegree.rounded, a = (scaleDegree - d) * 10 * (stepsPerOctave / 12); |
		(stepsPerOctave * (d // k)) + scale[d % k + 1] + a
	}

	linExpFromTo { :self :lo :hi |
		lo * ((hi / lo).log * self).exp
	}

	expRand { :self :upperBound |
		1.0.rand.linExpFromTo(self, upperBound)
	}

	coin { :self | randomFloat() < self }

	frac { :self | self.fractionPart }
	neg { :self :anObject | self.negated(anObject) }
	rem { :self :anObject | self.remainder(anObject) }
	trunc { :self | self.truncated }

	AmpDb { :self | self.log10 * 20 }
	DbAmp { :self | 10 ** (self * 0.05) }
	CpsMidi { :self | (log2 (self * (1 / 440)) * 12) + 69 }
	MidiCps { :self | 440 * (2 ** ((self - 69) * (1 / 12))) }

}

+ @Collection {

	abs { :self | self.collect(abs) }
	ceiling { :self | self.collect(ceiling) }
	cos { :self | self.collect(cos) }
	cubed { :self | self.collect(cubed) }
	exp { :self | self.collect(exp) }
	floor { :self | self.collect(floor) }
	fractionPart { :self | self.collect(fractionPart) }
	log { :self | self.collect(log) }
	log10 { :self | self.collect(log10) }
	log2 { :self | self.collect(log2) }
	negated { :self | self.collect(negated) }
	rounded { :self | self.collect(rounded) }
	sin { :self | self.collect(sin) }
	squared { :self | self.collect(squared) }
	sqrt { :self | self.collect(sqrt) }
	tanh { :self | self.collect(tanh) }

	AmpDb { :self | self.collect(AmpDb) }
	DbAmp { :self | self.collect(DbAmp) }
	MidiCps { :self | self.collect(MidiCps) }

}

+ @SequenceableCollection {

	+ { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, plus) }
	- { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, minus) }
	* { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, times) }
	/ { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, dividedBy) }
	< { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, lessThan) }
	> { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, greaterThan) }
	** { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, timesTimes) }
	% { :self :aNumber | withExtendingCollectOrAdaptTo(self, aNumber, percent) }

	bitAnd { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, bitAnd) }
	bitOr { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, bitOr) }
	min { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, min) }
	max { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, max) }
	roundTo { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, roundTo) }
	truncateTo { :self :anObject | self.withExtendingCollectOrAdaptTo(anObject, truncateTo) }

	degreeToKey { :self :scale :stepsPerOctave |
		self.collect { :scaleDegree |
			scaleDegree.degreeToKey(scale, stepsPerOctave)
		}
	}

}

+ @ArrayedCollection {

	rank { :self |
		1 + self.first.rank
	}

	shape { :self |
		[self.size] ++ self.first.shape
	}

}

+ Object {

	rank { :self |
		0
	}

	shape { :self |
		[]
	}

}
