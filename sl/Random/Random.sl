@Random {

	isRandom { :self |
		true
	}

	next { :self |
		self.nextRandomFloat
	}

	nextRandomFloat { :self |
		self.error('@Random>>nextRandomFloat: type responsibility')
	}

	nextRandomFloat { :self :aNumber |
		self.nextRandomFloat * aNumber
	}

	nextRandomFloat { :self :min :max |
		min + (self.nextRandomFloat * (max - min))
	}

	nextRandomFloatBipolar { :self :aNumber |
		self.nextRandomFloat(aNumber.negated, aNumber)
	}

	nextRandomInteger { :self :anInteger |
		self.nextRandomFloat(1, anInteger + 1).floor
	}

	nextRandomInteger { :self :min :max |
		self.nextRandomFloat(min, max + 1).floor
	}

	nextRandomIntegerBipolar { :self :anInteger |
		self.nextRandomFloat(anInteger.negated, anInteger + 1).floor
	}

	randomFloat { :self :max |
		self.nextRandomFloat * max
	}

	randomFloat { :self :min :max |
		min + self.randomFloat(max - min)
	}

	randomFloat { :self :min :max :countOrShape |
		countOrShape.isInteger.if {
			{ self.randomFloat(min, max) } ! countOrShape
		} {
			countOrShape.fill { :unusedIndex |
				self.randomFloat(min, max)
			}
		}
	}

}

+@Object {

	isRandom { :self |
		false
	}

}

