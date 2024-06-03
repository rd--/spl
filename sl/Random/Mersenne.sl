{- Requires: RandomNumberGenerator Iterator Stream -}

+SmallFloat {

	mt53RandomNumberGenerator { :self |
		<primitive: return sl.mersenneTwister53Generator(_self);>
	}

}

Mersenne : [Object, Iterator, RandomNumberGenerator, Stream] { | seed block |

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

+SmallFloat {

	Mersenne { :self |
		newMersenne().initialize(self)
	}

}

+Void {

	Mersenne {
		Mersenne(system.unixTimeInMilliseconds)
	}

}
