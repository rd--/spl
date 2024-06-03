{- Requires: RandomNumberGenerator Iterator Stream -}

+List {

	basicSfc32RandomNumberGenerator { :self |
		<primitive: return sl.sfc32Generator(_self[0], _self[1], _self[2], _self[3]);>
	}

	sfc32RandomNumberGenerator { :self |
		(self.size = 4).if {
			self.basicSfc32RandomNumberGenerator
		} {
			'List>>sfc32RandomNumberGenerator: invalid seed'.error
		}
	}

}

+String {

	hash { :self |
		self.murmur3Generator(1).value
	}

	murmur3Generator { :self :seed |
		<primitive: return sl.murmur3Generator(_self, _seed);>
	}

	murmur3 { :self :seed |
		let generator:/0 = self.murmur3Generator(seed);
		[
			generator(),
			generator(),
			generator(),
			generator()
		]
	}

	murmur3 { :self |
		self.murmur3(2166136261)
	}

}

Sfc32 : [Object, Iterator, RandomNumberGenerator, Stream] { | seed block |

	initialize { :self :aNumber |
		self.seed := aNumber;
		self.reset;
		self
	}

	nextRandomFloat { :self |
		self.block.value
	}

	reset { :self |
		self.block := self.seed.sfc32RandomNumberGenerator
	}

}

+String {

	Sfc32 { :self |
		newSfc32().initialize(self.murmur3(2166136261))
	}

}

+SmallFloat {

	Sfc32 { :self |
		Sfc32(self.truncated.asWords)
	}

}

+Void {

	Sfc32 {
		Sfc32(system.unixTimeInMilliseconds)
	}

}
