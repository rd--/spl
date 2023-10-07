Scale : [Object] { | startIndex intervals description |

	fractionalDegreeToKey { :self :scaleDegree |
		| accidental = (scaleDegree.fractionPart * 10).rounded; |
		(accidental > 5).ifTrue {
			accidental := (10 - accidental).negated
		};
		self.integerDegreeToKey(scaleDegree.rounded, accidental)
	}

	integerDegreeToKey { :self :scaleDegree :accidental |
		|(
			stepsPerOctave = self.tuningSize,
			tuningIndices = self.tuningIndices,
			baseKey = (stepsPerOctave * (scaleDegree // (self.size + 1))) + tuningIndices.atWrap(scaleDegree)
		)|
		(accidental = 0).if {
			baseKey
		} {
			baseKey + (accidental * (12 / stepsPerOctave))
		}
	}

	size { :self |
		self.intervals.size
	}

	storeString { :self |
		['Scale(', self.startIndex, ', ', self.intervals, ', "', self.description, '")'].join
	}

	tuningIndices { :self |
		| sum = self.startIndex, answer = [sum], tuningSize = self.tuningSize; |
		self.intervals.allButLastDo { :item |
			sum := ((sum - 1 + item) % tuningSize) + 1; (* one-indexed modulo *)
			answer.add(sum)
		};
		answer
	}

	tuningSize { :self |
		self.intervals.sum
	}

}

+@Integer {

	Scale { :startIndex :intervals :description |
		newScale().initializeSlots(startIndex, intervals, description)
	}

}

+Array {

	Scale { :self |
		| [startIndex, intervals, description] = self; |
		Scale(startIndex, intervals, description)
	}

}
