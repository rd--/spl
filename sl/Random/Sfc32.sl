{- Requires: Random Iterator Stream -}

+Array {

	basicSfc32RandomNumberGenerator { :self |
		<primitive: return sl.sfc32Generator(_self[0], _self[1], _self[2], _self[3]);>
	}

	sfc32RandomNumberGenerator { :self |
		(self.size = 4).if {
			self.basicSfc32RandomNumberGenerator
		} {
			'Array>>sfc32RandomNumberGenerator: invalid seed'.error
		}
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
		let generator = self.murmur3Generator(seed);
		[
			generator.value,
			generator.value,
			generator.value,
			generator.value
		]
	}

}

Sfc32 : [Object, Random, Iterator, Stream] { | seed block |

	initialize { :self :aNumber |
		self.seed := aNumber;
		self.reset;
		self
	}

	next { :self |
		self.block.value
	}

	randomFloat { :self |
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

	Random { :self |
		Sfc32(self)
	}

	Sfc32 { :self |
		Sfc32(self.truncated.asWords)
	}

}

+Void {

	Random {
		Sfc32()
	}

	Sfc32 {
		Sfc32(system.unixTimeInMilliseconds)
	}

}
