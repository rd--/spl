{- Requires: Random Iterator Stream -}

+SmallFloat {

	mt53RandomNumberGenerator { :self |
		<primitive: return sl.mersenneTwister53Generator(_self);>
	}

}

Mersenne : [Object, Random, Iterator, Stream] { | seed block |

	initialize { :self :aNumber |
		self.seed := aNumber;
		self.reset;
		self
	}

	next { :self |
		self.randomFloat
	}

	randomFloat { :self |
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
