Frequency : [Object] { | cyclesPerSecond |

	= { :self :other |
		other.isFrequency & {
			self.cyclesPerSecond = other.cyclesPerSecond
		}
	}

	~ { :self :other |
		other.isFrequency & {
			self.cyclesPerSecond ~ other.cyclesPerSecond
		}
	}

	Duration { :self |
		self.cyclesPerSecond.reciprocal.seconds
	}

	linearOctave { :self |
		self.cyclesPerSecond.cyclesPerSecondToLinearOctave
	}

	midiNoteNumber { :self |
		self.cyclesPerSecond.cyclesPerSecondToMidiNoteNumber
	}

	octavePitchClass { :self |
		self.midiNoteNumber.midiNoteNumberToOctavePitchClass
	}

	printString { :self |
		'Frequency(' ++ self.cyclesPerSecond ++ ')'
	}

}

+@Number {

	cyclesPerSecond { :self |
		newFrequency().initializeSlots(self)
	}

	cyclesPerSecondToLinearOctave { :self |
		(self * (1 / 440)).log2 + 4.75
	}

	cyclesPerSecondToMidiNoteNumber { :self |
		(self * (1 / 440)).log2 * 12 + 69
	}

	cyclesPerSecondToOctavePitchClass { :self |
		self.cyclesPerSecondToMidiNoteNumber.midiNoteNumberToOctavePitchClass
	}

	Frequency { :self |
		newFrequency().initializeSlots(self)
	}

	linearOctave { :self |
		self.linearOctaveToCyclesPerSecond.cyclesPerSecond
	}

	linearOctaveToMidiNoteNumber { :self |
		self.linearOctaveToCyclesPerSecond.cyclesPerSecondToMidiNoteNumber
	}

	linearOctaveToCyclesPerSecond { :self |
		440 * (2 ** (self - 4.75))
	}

	linearOctaveToOctavePitchClass { :self |
		self.linearOctaveToCyclesPerSecond.cyclesPerSecondToOctavePitchClass
	}

	midiNoteNumber { :self |
		self.midiNoteNumberToCyclesPerSecond.cyclesPerSecond
	}

	midiNoteNumberToCyclesPerSecond { :self |
		440 * (2 ** ((self - 69) * (1 / 12)))
	}

	midiNoteNumberToLinearOctave { :self |
		self.midiNoteNumberToCyclesPerSecond.cyclesPerSecondToLinearOctave
	}

	midiNoteNumberToOctavePitchClass { :self |
		|(
			octave = (self / 12).floor - 1,
			zero = (octave + 1) * 12,
			pitchClass = (self - zero) / 100
		)|
		octave + pitchClass
	}

	octavePitchClass { :self |
		self.octavePitchClassToCyclesPerSecond.cyclesPerSecond
	}

	octavePitchClassToCyclesPerSecond { :self |
		self.octavePitchClassToMidiNoteNumber.midiNoteNumberToCyclesPerSecond
	}

	octavePitchClassToLinearOctave { :self |
		self.octavePitchClassToMidiNoteNumber.midiNoteNumberToLinearOctave
	}

	octavePitchClassToMidiNoteNumber { :self |
		|(
			octave = self.floor,
			pitchClass = (self - octave) * 100
		)|
		(octave + 1) * 12 + pitchClass
	}

}

(* csound naming *)
+Frequency {

	cps { :self |
		self.cyclesPerSecond
	}

	pch { :self |
		self.octavePitchClass
	}

	oct { :self |
		self.linearOctave
	}

}


+@Number {

	cps { :self |
		self.cyclesPerSecond
	}

	cpsMidi { :self |
		self.cyclesPerSecondToMidiNoteNumber
	}

	cpsOct { :self |
		self.cyclesPerSecondToLinearOctave
	}

	cpsPch { :self |
		self.cyclesPerSecondToOctavePitchClass
	}

	oct { :self |
		self.linearOctave
	}

	octCps { :self |
		self.linearOctaveToCyclesPerSecond
	}

	octMidi { :self |
		self.linearOctaveToMidiNoteNumber
	}

	octPch { :self |
		self.linearOctaveToOctavePitchClass
	}

	pch { :self |
		self.octavePitchClass
	}

	pchCps { :self |
		self.octavePitchClassToCyclesPerSecond
	}

	pchMidi { :self |
		self.octavePitchClassToMidiNoteNumber
	}

	pchOct { :self |
		self.octavePitchClassToLinearOctave
	}

}

+Duration {

	Frequency { :self |
		self.seconds.reciprocal.cyclesPerSecond
	}

}

+Fraction {

	latticeVector { :self :limit |
		|(
			pf1 = self.numerator.primeFactors,
			pf2 = self.denominator.primeFactors.collect(negated:/1),
			pf3 = (pf1 ++ pf2).Bag
		)|
		[3, 5, 7, 11, 13].select { :each |
			each <= limit
		}.collect { :each |
			pf3.occurrencesOf(each) - pf3.occurrencesOf(each.negated)
		}
	}

	latticeVectorString { :self :limit |
		self.latticeVector(limit).collect { :each |
			each.asString.padLeft(2, ' ')
		}.joinSeparatedBy(' ')
	}

}

JiTuning : [Object] { | name description integerPitches limit degree |

	cents { :self |
		self.ratios.collect { :each |
			each.SmallFloat.log2 * 1200
		}
	}

	calculateDegree { :self |
		self.integerPitches.size
	}

	calculateLimit { :self |
		self.integerPitches.collect { :each |
			(each = 1).if {
				each
			} {
				each.primeFactors.max
			}
		}.max
	}

	degreeError { :self |
		self.error('degreeError')
	}

	initialize { :self :name :description :tuning |
		|(
			integerPitches = tuning.allSatisfy(isInteger:/1).if {
				tuning
			} {
				tuning / tuning.reduce(gcd:/2)
			}
		)|
		self.initializeSlots(
			name,
			description,
			integerPitches,
			nil,
			integerPitches.size
		);
		self.limit := self.calculateLimit;
		self
	}

	initializeFromDictionary { :self :aDictionary |
		self.initializeSlots(
			aDictionary::name,
			aDictionary::description,
			aDictionary::tuning,
			aDictionary::limit,
			aDictionary::degree
		)
	}

	isValid { :self |
		self.degree = self.calculateDegree & {
			self.limit = self.calculateLimit
		}
	}

	latticeVertices { :self |
		self.ratios.collect { :each |
			each.latticeVector(self.limit)
		}
	}

	latticeEdges { :self :vertices |
		| indices = [1 .. self.degree]; |
		[indices, indices].allTuples.select { :each |
			| [i, j] = each; |
			i < j & {
				vertices[i].latticeDistance(vertices[j]) = 1
			}
		}
	}

	limitError { :self |
		self.error('limitError')
	}

	ratios { :self |
		| i1 = self.integerPitches.first; |
		self.integerPitches.collect { :each |
			Fraction(each, i1).normalized
		}
	}

}

+Record {

	JiTuning { :self |
		newJiTuning().initializeFromDictionary(self)
	}

}

+Array {

	JiTuning { :self |
		newJiTuning().initialize(
			'',
			'',
			self
		)
	}

	latticeCoordinates { :self :unitVector |
		self.withCollect(unitVector.first(self.size)) { :count :unit |
			count * unit
		}.sum
	}

	latticeDistance { :self :anArray |
		(self - anArray).abs.sum
	}

	wilsonLatticeCoordinates { :self |
		self.latticeCoordinates([20@0, 0@20, 4@3, -3@4, -1@2])
	}

}
