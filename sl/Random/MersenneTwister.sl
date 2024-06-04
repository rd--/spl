{- Requires: RandomNumberGenerator Iterator Stream -}

MersenneTwister : [Object, Iterator, RandomNumberGenerator, Stream] { | seed block |

	initialize { :self :aNumber |
		self.seed := aNumber;
		self.reset;
		self
	}

	nextRandomFloat { :self |
		self.block.value
	}

	reset { :self |
		self.block := self.seed.mt53RandomNumberGenerator
	}

}

+@Integer {

	mt53RandomNumberGenerator { :self |
		<primitive: return sl.mersenneTwister53Generator(_self);>
	}

	MersenneTwister { :self |
		newMersenneTwister().initialize(self)
	}

}

+Void {

	MersenneTwister {
		MersenneTwister(system.unixTimeInMilliseconds)
	}

}
