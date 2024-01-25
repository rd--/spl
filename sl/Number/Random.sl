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

}

+@Object {

	isRandom { :self |
		false
	}

}

