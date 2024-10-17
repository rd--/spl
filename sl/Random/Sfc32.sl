/* Requires: RandomNumberGenerator Iterator Stream */

Sfc32 : [Object, Iterator, RandomNumberGenerator, Stream] { | seed block |

	initialize { :self :anObject |
		self.seed := anObject.asSfc32State;
		self.reset;
		self
	}

	nextRandomFloat { :self |
		self.block.value
	}

	reset { :self |
		self.block := self.seed.sfc32RandomNumberGeneratorBlock
	}

}

+List {

	asSfc32State { :self |
		(self.size = 4).if {
			self
		} {
			'List>>asSfc32State: invalid list'.error
		}
	}

	basicSfc32RandomNumberGenerator { :self |
		<primitive: return sl.sfc32Generator(_self[0], _self[1], _self[2], _self[3]);>
	}

	sfc32RandomNumberGeneratorBlock { :self |
		self.asSfc32State.basicSfc32RandomNumberGenerator
	}

	Sfc32 { :self |
		newSfc32().initialize(self.asSfc32State)
	}

}

+String {

	asSfc32State { :self :seed |
		let generator:/0 = self.murmurHashGenerator(seed);
		[
			generator(),
			generator(),
			generator(),
			generator()
		]
	}

	asSfc32State { :self |
		self.asSfc32State(2166136261)
	}

	hash { :self |
		self.murmurHashGenerator(2166136261).value
	}

	murmurHashGenerator { :self :seed |
		<primitive: return sl.murmur3Generator(_self, _seed);>
	}

	Sfc32 { :self |
		Sfc32(self.asSfc32State(2166136261))
	}

}

+@Integer {

	asSfc32State { :self |
		self.truncated.asWords.asSfc32State
	}

	Sfc32 { :self |
		Sfc32(self.asSfc32State)
	}

}

+Void {

	Sfc32 {
		Sfc32(system.unixTimeInMilliseconds.asSfc32State)
	}

}
