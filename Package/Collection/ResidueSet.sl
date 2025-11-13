/* Requires: BitSet Set */

ResidueSet : [Object, Storeable, Equatable, Iterable, Collection, Extensible] { | contents modulus |

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
		self.positionVector
	}

	asIdentitySet { :self |
		self.contents.copy
	}

	bitVector { :self |
		let positions = self.contents;
		0.to(self.modulus).collect { :each |
			positions.includes(each).boole
		}
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

	positionVector { :self |
		self.contents.asList.sort
	}

	size { :self |
		self.contents.size
	}

	storeString { :self |
		'ResidueSet(%, %)'.format(
			[
				self.positionVector.storeString,
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
			0.to(modulus - 1),
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
		ResidueSet(
			self.positionVector,
			self.capacity
		)
	}

}

+String {

	asResidueSet { :self |
		self.asBitSet.asResidueSet
	}

}
