+SmallFloat {
	mt53RandomNumberGenerator { :self |
		<primitive: return sl.mersenneTwister53Generator(_self);>
	}

	sfc32RandomNumberGenerator { :self :b :c :d |
		<primitive: return sl.sfc32Generator(_self, _b, _c, _d);>
	}

	splitMix32RandomNumberGenerator { :self |
		<primitive: return sl.splitMix32Generator(_self);>
	}

}

+String {

	murmurHash3Generator { :self |
		<primitive: return sl.murmurHash3Generator(_self);>
	}

}

Random : [Object] { | randomNumberGenerator |

	next { :self |
		self.randomFloat
	}

	randomFloat { :self |
		self.randomNumberGenerator.value
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

+String {

	Sfc { :self |
		|(
			seedGenerator = self.murmurHash3Generator,
			randomNumberGenerator = sfc32RandomNumberGenerator(
				seedGenerator.value,
				seedGenerator.value,
				seedGenerator.value,
				seedGenerator.value
			)
		)|
		newRandom().initializeSlots(randomNumberGenerator)
	}

}

+SmallFloat {

	MersenneTwister { :self |
		newRandom().initializeSlots(self.mt53RandomNumberGenerator)
	}

	Random { :self |
		self.truncated.asWords.Sfc
	}

	SplitMix { :self |
		newRandom().initializeSlots(self.splitMix32RandomNumberGenerator)
	}

}

+Void {

	MersenneTwister {
		system.unixTimeInMilliseconds.MersenneTwister
	}

	Random {
		system.unixTimeInMilliseconds.Random
	}

}

+LargeInteger {

	fnv1aHash { :self |
		|(
			fnvPrime = 16777619,
			hash = self.negative.if {
				3490449840
			} {
				2166136261
			}
		)|
		1.upTo(self.digitLength).do { :index |
			hash := 16rFFFFFFFF.bitAnd(hash.bitXor(self.digitAt(index)) * fnvPrime)
		};
		hash
	}

}
