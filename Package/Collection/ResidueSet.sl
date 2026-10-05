/* Requires: BitSet Set */

ResidueSet : [Object, Store, Equal, Iterable, Collection, Extensible] { | contents modulus |

	[plus, +] { :self :anInteger |
		ResidueSet(
			self.contents + anInteger,
			self.modulus
		)
	}

	[subtract, -] { :self :anInteger |
		ResidueSet(
			self.contents - anInteger,
			self.modulus
		)
	}

	[times, *] { :self :anInteger |
		ResidueSet(
			self.contents * anInteger,
			self.modulus
		)
	}

	BitSet { :self |
		BitSet(
			self.contents,
			self.modulus
		)
	}

	bitString { :self |
		self.BitSet.String
	}

	bitVector { :self |
		let positions = self.contents;
		0.to(self.modulus).collect { :each |
			positions.includes(each).boole
		}
	}

	boxNotation { :self |
		self.BitSet.boxNotation
	}

	complement { :self |
		self.BitSet.complement.ResidueSet
	}

	do { :self :aBlock/1 |
		self.contents.do(aBlock/1)
	}

	IdentitySet { :self |
		self.contents.copy
	}

	include! { :self :anInteger |
		self.contents.include!(anInteger % self.modulus)
	}

	List { :self |
		self.positionVector
	}

	positionVector { :self |
		self.contents.List.sort
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

	ResidueSet { :self :modulus |
		let r = newResidueSet().initializeSlots(IdentitySet(), modulus);
		r.includeAll!(self % modulus);
		r
	}

}

+BitSet {

	ResidueSet { :self |
		ResidueSet(
			self.positionVector,
			self.capacity
		)
	}

}

+String {

	ResidueSet { :self |
		self.BitSet.ResidueSet
	}

}
