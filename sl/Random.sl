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
