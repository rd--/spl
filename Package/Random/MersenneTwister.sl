/* Requires: RandomNumberGenerator Iterator Stream */

MersenneTwister : [Object, Equatable, Iterator, RandomNumberGenerator, Stream] { | seed block |

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
		<primitive:
		const mt = new sl.MersenneTwister(_self);
		return function () {
			return mt.genrand_res53();
		};
		>
	}

	MersenneTwister { :self |
		newMersenneTwister().initialize(self)
	}

}

+Void {

	MersenneTwister {
		MersenneTwister(system.absoluteTime)
	}

}
