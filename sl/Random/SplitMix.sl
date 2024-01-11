{- Requires: Random Iterator Stream -}

+SmallFloat {

	splitMix32RandomNumberGenerator { :self |
		<primitive: return sl.splitMix32Generator(_self);>
	}

}

SplitMix : [Object, Random, Iterator, Stream] { | seed block |

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
		self.block := self.seed.splitMix32RandomNumberGenerator
	}

}

+SmallFloat {

	SplitMix { :self |
		newSplitMix().initialize(self)
	}

}

+Void {

	SplitMix {
		SplitMix(system.unixTimeInMilliseconds)
	}

}
