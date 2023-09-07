@Random {

	next { :self |
		self.randomFloat
	}

	randomFloat { :self |
		self.error('@Random>>randomFloat: type responsibility')
	}

	randomFloat { :self :aNumber |
		self.randomFloat * aNumber
	}

	randomFloat { :self :min :max |
		min + self.randomFloat(max - min)
	}

	randomInteger { :self :anInteger |
		self.randomFloat(1, anInteger + 1).floor
	}

	randomInteger { :self :min :max |
		self.randomFloat(min, max + 1).floor
	}

}
