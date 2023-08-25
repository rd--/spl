+SmallFloat {
	mt53RandomNumberGenerator { :self |
		<primitive: return sl.mersenneTwister53Generator(_self);>
	}

	splitMix32RandomNumberGenerator { :self |
		<primitive: return sl.splitMix32Generator(_self);>
	}

}

+Array {

	sfc32RandomNumberGenerator { :self |
		<primitive: return sl.sfc32Generator(_self[0], _self[1], _self[2], _self[3]);>
	}

}

+String {

	murmur3Generator { :self :seed |
		<primitive: return sl.murmur3Generator(_self, _seed);>
	}

	murmur3 { :self |
		self.murmur3(2166136261)
	}

	murmur3 { :self :seed |
		| generator = self.murmur3Generator(seed); |
		[
			generator.value,
			generator.value,
			generator.value,
			generator.value
		]
	}

}

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

Random : [Object, Random] { | randomNumberGenerator |

	randomFloat { :self |
		self.randomNumberGenerator.value
	}

}

+String {

	Sfc { :self |
		|(
			seed = self.murmur3(2166136261),
			randomNumberGenerator = sfc32RandomNumberGenerator(seed)
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
