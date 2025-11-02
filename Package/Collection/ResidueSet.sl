/* Requires: BitSet Set */

ResidueSet : [Object, Equatable, Iterable, Collection, Extensible] { | contents modulus |

	+ { :self :anInteger |
		ResidueSet(
			self.contents + anInteger,
			self.modulus
		)
	}

	- { :self :anInteger |
		ResidueSet(
			self.contents - anInteger,
			self.modulus
		)
	}

	* { :self :anInteger |
		ResidueSet(
			self.contents * anInteger,
			self.modulus
		)
	}

	asBitSet { :self |
		self.contents.asBitSet(self.modulus)
	}

	asBitString { :self |
		self.asBitSet.asString
	}

	asList { :self |
		self.contents.asList.sort
	}

	asIdentitySet { :self |
		self.contents.copy
	}

	boxNotation { :self |
		self.asBitSet.boxNotation
	}

	complement { :self |
		self.asBitSet.complement.asResidueSet
	}

	do { :self :aBlock:/1 |
		self.contents.do(aBlock:/1)
	}

	include { :self :anInteger |
		self.contents.include(anInteger % self.modulus)
	}

	size { :self |
		self.contents.size
	}

	storeString { :self |
		'ResidueSet(%, %)'.format(
			[
				self.asList.storeString,
				self.modulus.printString
			]
		)
	}

	species { :self |
		{
			ResidueSet([], self.modulus)
		}
	}

}

+@Integer {

	leastResidueSystem { :modulus |
		ResidueSet(
			(0 .. modulus - 1),
			modulus
		)
	}

}

+@Collection {

	asResidueSet { :self :modulus |
		ResidueSet(self, modulus)
	}

	ResidueSet { :self :modulus |
		let r = newResidueSet().initializeSlots(IdentitySet(), modulus);
		r.includeAll(self % modulus);
		r
	}

}

+BitSet {

	asResidueSet { :self |
		self.asList.asResidueSet(self.capacity)
	}

}

+String {

	asResidueSet { :self |
		self.asBitSet.asResidueSet
	}

}
